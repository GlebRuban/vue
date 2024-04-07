<template>
  <div class="center">
    <div class="row">

      <div>
        Город
        <select v-model="selectedCity">
          <option v-for="city in citiesWithData" :key="city.id" :value="city">
            {{ city.name }}
          </option>
        </select>
      </div>

     <div>
        Цех
        <select v-model="selectedManufactory">
          <option v-for="manufactory in manufactories" :key="manufactory.id" :value="manufactory">
            {{ manufactory.name }}
          </option>
        </select>
     </div>

     <div>
        Рабочий
        <select v-model="selectedEmployee">
          <option v-for="employee in employees" :key="employee.id" :value="employee">
            {{ employee.name }}
          </option>
        </select>
     </div>

    </div>

    <div class="row">
      <div>
        Бригада
        <select v-model="selectedBrigade" >
          <option v-for="brigade in brigades" :key="brigade.id" :value="brigade">
            {{ brigade.name }}
          </option>
        </select>
      </div>

      <div>
        Смена
        <select v-model="selectedShift">
          <option v-for="shift in shifts" :key="shift.id" :value="shift">
            {{ shift.name }}
          </option>
        </select>
      </div>
    </div>

    <div class="row" @click="saveSelectedValues">
      <button>Сохранить выбраные значения в куки как JSON</button>
    </div>
  </div>
</template>

<script>
import cities from '../cities.json'
export default {
  name: 'MainSelect',
  data() {
    return {
      selectedCity: undefined,
      selectedManufactory: undefined,
      selectedEmployee: undefined,
      selectedBrigade: undefined,
      selectedShift: undefined,
      citiesWithData: [],
      brigades: [
        { id: 'brigades_1', name: 'Бригада № 1' },
        { id: 'brigades_2', name: 'Бригада № 2' },
        { id: 'brigades_3', name: 'Бригада № 3' },
        { id: 'brigades_4', name: 'Бригада № 4' },
        { id: 'brigades_5', name: 'Бригада № 5' },
      ],
      shifts: [
        { id: 'shift_1', name: 'Дневная' },
        { id: 'shift_2', name: 'Ночная' },
      ],
    }
  },
  mounted() {
    this.citiesWithData = cities.map((city, cityIndex) => ({
      id: `city_${cityIndex + 1}`,
      name: city.city,
      manufactories: new Array(10).fill(undefined).map((_, manufactoryIndex) => ({
        id: `manufactory_${cityIndex + 1}_${manufactoryIndex + 1}`,
        name: `Цех № ${manufactoryIndex + 1}. Город: ${city.city}`,
        employees: new Array(5).fill(undefined).map((_, employeeIndex) => ({
          id: `employee_${employeeIndex + 1}_${manufactoryIndex + 1}_${cityIndex + 1}`,
          name: `Сотрудник номер ${employeeIndex + 1}. Цех № ${manufactoryIndex + 1}. Город: ${city.city}.`,
        }))
      })),
    }));
  },
  // Тут два варианта
  // через watchers или @change
  // по сути ни чем не отличается в плане перформанса тут больше зависит от того как принято в команде такое реализовывать
  // я решил сделать через watchers
  watch: {
    // также когда мы сменили город мы обнуляем выбраный цех и выбраного работника если они были выбраны ранее
    selectedCity() {
      this.selectedManufactory = undefined;
      this.selectedEmployee = undefined;
    },
  },
  computed: {
    manufactories() {
      return this.selectedCity?.manufactories ?? [];
    },
    employees() {
      return this.selectedManufactory?.employees ?? [];
    },
  },
  methods: {
    saveSelectedValues() {
      const valueAsString = JSON.stringify({
        selectedCity: this.selectedCity?.id,
        selectedManufactory: this.selectedManufactory?.id,
        selectedEmployee: this.selectedEmployee?.id,
        selectedBrigade: this.selectedBrigade?.id,
        selectedShift: this.selectedShift?.id,
      });
      // Сохраняем только id так как в теории может быть больше данных а размер куки ограничен
      document.cookie = `selectedValues=${valueAsString}; path=/; expires=Fri, 31 Dec 2038 23:59:59 GMT`;
    },
  }
}
</script>


<style scoped>
  select {
    min-width: 150px;
    height: 34px;
    width: fit-content;
  }
  .center {
    display: flex;
    flex-direction: column;
    gap: 10px;
    align-items: center;
    justify-content: center;
  }
  .row {
    gap: 20px;
    display: flex;
  }
</style>
