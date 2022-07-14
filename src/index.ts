import moment from 'moment';

export async function handler (event: any) {
  return { hello: 'world', date: moment().format() }
}