Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52D0013885F
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jan 2020 22:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732825AbgALVq2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 12 Jan 2020 16:46:28 -0500
Received: from mga12.intel.com ([192.55.52.136]:16541 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727128AbgALVq2 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 12 Jan 2020 16:46:28 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jan 2020 13:46:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,426,1571727600"; 
   d="gz'50?scan'50,208,50";a="372095135"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Jan 2020 13:46:21 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iql3t-00044R-4Y; Mon, 13 Jan 2020 05:46:21 +0800
Date:   Mon, 13 Jan 2020 05:45:39 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     kbuild-all@lists.01.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Joe Perches <joe@perches.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] rtc: i2c/spi: Avoid inclusion of REGMAP support when not
 needed
Message-ID: <202001130520.bXS12E9N%lkp@intel.com>
References: <20200112171349.22268-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="e2l4fr2wrbaq7jyz"
Content-Disposition: inline
In-Reply-To: <20200112171349.22268-1-geert@linux-m68k.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--e2l4fr2wrbaq7jyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

I love your patch! Yet something to improve:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on v5.5-rc5 next-20200110]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/rtc-i2c-spi-Avoid-inclusion-of-REGMAP-support-when-not-needed/20200113-013332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
config: powerpc-defconfig (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.5.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-ds1307.c:1570:21: error: variable 'regmap_config' has initializer but incomplete type
    static const struct regmap_config regmap_config = {
                        ^~~~~~~~~~~~~
>> drivers/rtc/rtc-ds1307.c:1571:3: error: 'const struct regmap_config' has no member named 'reg_bits'
     .reg_bits = 8,
      ^~~~~~~~
>> drivers/rtc/rtc-ds1307.c:1571:14: warning: excess elements in struct initializer
     .reg_bits = 8,
                 ^
   drivers/rtc/rtc-ds1307.c:1571:14: note: (near initialization for 'regmap_config')
>> drivers/rtc/rtc-ds1307.c:1572:3: error: 'const struct regmap_config' has no member named 'val_bits'
     .val_bits = 8,
      ^~~~~~~~
   drivers/rtc/rtc-ds1307.c:1572:14: warning: excess elements in struct initializer
     .val_bits = 8,
                 ^
   drivers/rtc/rtc-ds1307.c:1572:14: note: (near initialization for 'regmap_config')
   drivers/rtc/rtc-ds1307.c: In function 'ds1307_probe':
>> drivers/rtc/rtc-ds1307.c:1596:19: error: implicit declaration of function 'devm_regmap_init_i2c'; did you mean 'devm_request_irq'? [-Werror=implicit-function-declaration]
     ds1307->regmap = devm_regmap_init_i2c(client, &regmap_config);
                      ^~~~~~~~~~~~~~~~~~~~
                      devm_request_irq
>> drivers/rtc/rtc-ds1307.c:1596:17: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     ds1307->regmap = devm_regmap_init_i2c(client, &regmap_config);
                    ^
   drivers/rtc/rtc-ds1307.c: At top level:
>> drivers/rtc/rtc-ds1307.c:1570:35: error: storage size of 'regmap_config' isn't known
    static const struct regmap_config regmap_config = {
                                      ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/regmap_config +1570 drivers/rtc/rtc-ds1307.c

445c02076f1e60 Akinobu Mita             2016-01-25  1569  
11e5890b5342c8 Heiner Kallweit          2017-03-10 @1570  static const struct regmap_config regmap_config = {
11e5890b5342c8 Heiner Kallweit          2017-03-10 @1571  	.reg_bits = 8,
11e5890b5342c8 Heiner Kallweit          2017-03-10 @1572  	.val_bits = 8,
11e5890b5342c8 Heiner Kallweit          2017-03-10  1573  };
11e5890b5342c8 Heiner Kallweit          2017-03-10  1574  
5a167f4543e45d Greg Kroah-Hartman       2012-12-21  1575  static int ds1307_probe(struct i2c_client *client,
d2653e92732bd3 Jean Delvare             2008-04-29  1576  			const struct i2c_device_id *id)
1abb0dc92d706e David Brownell           2006-06-25  1577  {
1abb0dc92d706e David Brownell           2006-06-25  1578  	struct ds1307		*ds1307;
1abb0dc92d706e David Brownell           2006-06-25  1579  	int			err = -ENODEV;
584ce30c72954e Heiner Kallweit          2017-08-29  1580  	int			tmp;
7624df482d7aba Heiner Kallweit          2017-07-12  1581  	const struct chip_desc	*chip;
82e2d43f6315d7 Heiner Kallweit          2017-07-12  1582  	bool			want_irq;
8bc2a40730ec74 Michael Lange            2016-01-21  1583  	bool			ds1307_can_wakeup_device = false;
042fa8c7c04dd4 Alexandre Belloni        2017-09-04  1584  	unsigned char		regs[8];
01ce893d37f053 Jingoo Han               2013-11-12  1585  	struct ds1307_platform_data *pdata = dev_get_platdata(&client->dev);
d8490fd55ab90e Heiner Kallweit          2017-07-12  1586  	u8			trickle_charger_setup = 0;
1abb0dc92d706e David Brownell           2006-06-25  1587  
edca66d2ceae6b Jingoo Han               2013-07-03  1588  	ds1307 = devm_kzalloc(&client->dev, sizeof(struct ds1307), GFP_KERNEL);
40ce972d59fcfd David Anders             2012-03-23  1589  	if (!ds1307)
c065f35c179290 David Brownell           2007-07-17  1590  		return -ENOMEM;
045e0e85f2f6ee David Brownell           2007-07-17  1591  
11e5890b5342c8 Heiner Kallweit          2017-03-10  1592  	dev_set_drvdata(&client->dev, ds1307);
11e5890b5342c8 Heiner Kallweit          2017-03-10  1593  	ds1307->dev = &client->dev;
11e5890b5342c8 Heiner Kallweit          2017-03-10  1594  	ds1307->name = client->name;
33df2ee1bb59b8 Joakim Tjernlund         2009-06-17  1595  
11e5890b5342c8 Heiner Kallweit          2017-03-10 @1596  	ds1307->regmap = devm_regmap_init_i2c(client, &regmap_config);
11e5890b5342c8 Heiner Kallweit          2017-03-10  1597  	if (IS_ERR(ds1307->regmap)) {
11e5890b5342c8 Heiner Kallweit          2017-03-10  1598  		dev_err(ds1307->dev, "regmap allocation failed\n");
11e5890b5342c8 Heiner Kallweit          2017-03-10  1599  		return PTR_ERR(ds1307->regmap);
11e5890b5342c8 Heiner Kallweit          2017-03-10  1600  	}
11e5890b5342c8 Heiner Kallweit          2017-03-10  1601  
11e5890b5342c8 Heiner Kallweit          2017-03-10  1602  	i2c_set_clientdata(client, ds1307);
7ef6d2c266e5b0 Javier Martinez Canillas 2017-03-03  1603  
7ef6d2c266e5b0 Javier Martinez Canillas 2017-03-03  1604  	if (client->dev.of_node) {
7ef6d2c266e5b0 Javier Martinez Canillas 2017-03-03  1605  		ds1307->type = (enum ds_type)
7ef6d2c266e5b0 Javier Martinez Canillas 2017-03-03  1606  			of_device_get_match_data(&client->dev);
7ef6d2c266e5b0 Javier Martinez Canillas 2017-03-03  1607  		chip = &chips[ds1307->type];
7ef6d2c266e5b0 Javier Martinez Canillas 2017-03-03  1608  	} else if (id) {
9c19b8930d2cf9 Tin Huynh                2016-11-30  1609  		chip = &chips[id->driver_data];
3760f736716f74 Jean Delvare             2008-04-29  1610  		ds1307->type = id->driver_data;
9c19b8930d2cf9 Tin Huynh                2016-11-30  1611  	} else {
9c19b8930d2cf9 Tin Huynh                2016-11-30  1612  		const struct acpi_device_id *acpi_id;
9c19b8930d2cf9 Tin Huynh                2016-11-30  1613  
9c19b8930d2cf9 Tin Huynh                2016-11-30  1614  		acpi_id = acpi_match_device(ACPI_PTR(ds1307_acpi_ids),
11e5890b5342c8 Heiner Kallweit          2017-03-10  1615  					    ds1307->dev);
9c19b8930d2cf9 Tin Huynh                2016-11-30  1616  		if (!acpi_id)
9c19b8930d2cf9 Tin Huynh                2016-11-30  1617  			return -ENODEV;
9c19b8930d2cf9 Tin Huynh                2016-11-30  1618  		chip = &chips[acpi_id->driver_data];
9c19b8930d2cf9 Tin Huynh                2016-11-30  1619  		ds1307->type = acpi_id->driver_data;
9c19b8930d2cf9 Tin Huynh                2016-11-30  1620  	}
33df2ee1bb59b8 Joakim Tjernlund         2009-06-17  1621  
82e2d43f6315d7 Heiner Kallweit          2017-07-12  1622  	want_irq = client->irq > 0 && chip->alarm;
82e2d43f6315d7 Heiner Kallweit          2017-07-12  1623  
9c19b8930d2cf9 Tin Huynh                2016-11-30  1624  	if (!pdata)
d8490fd55ab90e Heiner Kallweit          2017-07-12  1625  		trickle_charger_setup = ds1307_trickle_init(ds1307, chip);
9c19b8930d2cf9 Tin Huynh                2016-11-30  1626  	else if (pdata->trickle_charger_setup)
d8490fd55ab90e Heiner Kallweit          2017-07-12  1627  		trickle_charger_setup = pdata->trickle_charger_setup;
33b04b7b7c03d0 Matti Vaittinen          2014-10-13  1628  
d8490fd55ab90e Heiner Kallweit          2017-07-12  1629  	if (trickle_charger_setup && chip->trickle_charger_reg) {
d8490fd55ab90e Heiner Kallweit          2017-07-12  1630  		trickle_charger_setup |= DS13XX_TRICKLE_CHARGER_MAGIC;
11e5890b5342c8 Heiner Kallweit          2017-03-10  1631  		dev_dbg(ds1307->dev,
11e5890b5342c8 Heiner Kallweit          2017-03-10  1632  			"writing trickle charger info 0x%x to 0x%x\n",
d8490fd55ab90e Heiner Kallweit          2017-07-12  1633  			trickle_charger_setup, chip->trickle_charger_reg);
11e5890b5342c8 Heiner Kallweit          2017-03-10  1634  		regmap_write(ds1307->regmap, chip->trickle_charger_reg,
d8490fd55ab90e Heiner Kallweit          2017-07-12  1635  			     trickle_charger_setup);
33b04b7b7c03d0 Matti Vaittinen          2014-10-13  1636  	}
eb86c3064b3c53 Wolfram Sang             2012-05-29  1637  

:::::: The code at line 1570 was first introduced by commit
:::::: 11e5890b5342c82eefbaa39aec4767ae21ae8803 rtc: ds1307: convert driver to regmap

:::::: TO: Heiner Kallweit <hkallweit1@gmail.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@free-electrons.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--e2l4fr2wrbaq7jyz
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
ENHMh9rdLaY++mkfx4l3+dC7DTn69EASfDXw0C/bRFQuV/ZILmOzyLubnYk4kW91LzlHF/DD
pUcRCvwrINNcaB6klcotcyIV4667nJjR9igyVItO8q6jayvZ17tFnKXos44rPNYiuXQDHVE6
umGS/MQs0F1uiUuS37XpztotU5hRgQIYYYjouZTCzcIgGU4kvs8cUeIoGQ43vkA0fWXdhxJC
x4LfXoEKM528F3GtOmQYBabfqpLzKoA7GzqiFZXn8KtSECg+5Bcsmd+71NHNlhMxLyrO6pfo
e9jY+O/We/TLY65f+QMAmT0UhHjEbPsxZh5pzRHhO0dPSrH+ZZF+VrAMWCpW7O0/DIIgfTuQ
MW+o94wXDGLykn5Ir6tbMwcTa/zyVxs3z20EmAHfXTjZ5gZ89WPUVNovu3VL1KnwVj55N1KR
8wMG2W5CuF2B1Zx8LxUyqI02DQUKsxxzXhGo8ZLEDahLj0dLaN4ouokYZLN7QpPEmRSKcRxH
Qi06q92Lqt7LqFNct+zenTnlzDLYe2WMXuebR6BhTIz0+f3T08vLw9ent5/vNC5NMIzueF8v
EFA5SFW6XxX/btOB5dp9CDW0+rRX6N+8cp0XRsDXOUgycKpE10sMm4yd+2pNXnRmJFtnRtFQ
O4lGZbU+T6fYvWzbzjjePUB/Opjh6WSj9DLPNa7MWnNfRTCtcZgqkIsix1xzjC6lbyu3qoPd
KvLTmrvP6C7O59iIhuh8mAXTfeHtK1UVQbA6ezFbGGwoydOlOdOlefejQBDlW9uDOt/Zu8Bh
L+d/u3MOjjnSAVQJRoXzIcpQrFbLu7UXhI3RcaXpNnSwnHHeN2FL5MvD+7tLJY9WUt9tjb2V
lBSHiKWfIj6vTocXNxkcjf87oS7QeYkaVo9P32CPfp+8fZ1UslKTP3/+mGySe3KhWUWT14df
V6c/Dy/vb5M/nyZfn54enx7/b4JeeuyS9k8v3yaf375PXt++P02ev35+6+5bDc4WUqxkj4aZ
jWpCHY3iIqHFVrjPYBu3BbaKYydsnKrwGnAUBv9mOFUbVUVRyVjv9mGMBroN+3BIi2qfj1cr
EnGI3PyjDcszT9gIG3gvynS8uOa2pYYBkePjEWfQiZvVzBML7SCGRyeuNfX68BdGkHJ49KQT
KZKcERqRUQj0zCxV8MrldHRFGcPTUum0XUSMs106tk+M8V5D5GO/oecnDALgPQbWXS2wW6eR
n2ZmYxqGGLll67IqTP44VYxJZUNlPD3Rphgd9MEtMpqmHSsmniyFw4t3uWbvWgjh2davM1Ze
1pIx+jQwMlLmuz3i7zLo5NWoRuIOx0xdgBfJEQweMlf9TVMB77U57vhBZ+wx6WAoBbCiroAg
3fbnJ1GWyoPAs8/Dy1SxNsfjVp31wbN2VIUKf1vmDQAAF8jNT4b4I3XnmZ9ryPPB39kyOPNb
0L4Crhn+MV8yjghs0GLF+PWgvkfnwTBqcenvIrkXedUL43RbYsWXX+/Pn0AaTB5+uR1PZnlh
WGIZK7cS0HX1z/svbZbsx9TTLWQnoh3ziqQvBeNhk/goCtFwUpozMebsSeN0EMHn+tkgQlHo
PCssQ1QZhdr/r+w6mttGgvVfUfm0W7XBooKpgw8gAokVkhBEUheULHFl1lqiiqLert+vf90z
GGBCN6h3cOD0h8mhp6eDvk6G1NaRCZqgWYnzL8M1j3Ei0CmyKQURvY7iWWIURA5edvZ5cnFF
L0dZhp9enjFK8gPgYgQgrN3oA2yg02tA0TlXTT39akIvMwEofO9qvAS07aSXRUe/uGB8bwx0
xoRd0ZkTpaNPOfNZRee0oYcGMiaiPeCSsdCUgxhMOKdAgo4B9y4YzWcJSPyLq1NGAaMf5gva
W4+gx9XZaZScnTKGjzrGUvSwZrng5b/92L7888vpr2KrKOezk+6R4v3lERCEwOrkl0FS+Kuz
Tma4NVKK8bJ7e7/u5ldpsuKixws6RrghG1Lvt09P1HpFGfw8ZMQjnu+H6BMkTmLGdCWGv7N4
5mXUnTkMUCGkzlEIU/llo0mHBMmRR2GqhekCzVTrytSRFURO+1UQXWfJItkPE1o8IWuLjrsZ
c94BwPgrkfkXvuWboKOWtY9Blob2YYLcq42khV/n1ZpOVGrTn/aHh8+fdAAQ63zhm191idZX
fX0RwnUh0rIu2o2YNCXGfNaDoWpAuJpH/RDZ6ajfTCRbTuT19LaJ4f6TNvQ4iVqXtw5D0Ytr
sabE8aS+82azi7uQuaIMoDC/oy+mA2Q1/UwpRChAUAG78cVu5ECBqZgBN8jETdegjN8pDXL5
hd5qFWSxTqecs3uFQc+DV8y9UGHK6sI/O1JWXCWnE8Z9hIlhFN8sEH01UqAVQGjJgEIIn3HM
YWpgOL82BujsI6CPYBj3G/1onJ/WjFdDBZndnE3oW7pCVMAHXTE+WhUmSs9OGWaqH3WY6IyS
uQa5YHSy9VwYpy0KEqbAPNI8QZ/LLUDGJ1d5O50yF5e+YwJYf1Nn90Av5+buoe9OGNcB1cCE
dUePRxfeH9h1gupswnCM2rSYnH6k+VemDEQ6Iv9xfwA25flYPfw0Z4IYDrvJhPEFoUEumCNQ
h1yMjwFuW9OLNvLSmNGE0pBfGH59gEzOmXtoP+b19emX2hufO+n5tD7SeoQwcUV0CBO6uYdU
6eXkSKNmN+ccD93Ph+LCZxh9BcEZQymAKXof3sBKv1tnN6nrSX338jsGpTkyzTqlxNGKoSZS
xiic9rtTDf87tvlwb+j9yGeMG/q+F79YcoFet7PavLwB88+0NkBvbbfkEyaQZk2kvVv2H2FQ
JfTCYDW8E0RY32m8eLPqRGCUlCzODcEYhstigmYgreiGKC5pnWHEBMD7HcN4nLxDBiT1c04Q
LMORjs4SxGRhzQi7MIOysUNDadQ0umRMLm4jMt4WtLOdrQsUkqRe5s1NO0HU41dmbcTHMoqX
E7IsDbNGc4wiE/FBzwZiZ8ibjgOfoWq+eEM2KoORYNm4vKr4lIhnkW4f9ru33d+Hk8XP183+
99uTp/fN28FQcFC+aI5AhwLnZejGulLzvfbmMePccp4nQRQzEqnFEs7XDENaOI3wRRCLave+
NzxPqqGcTi7O2i7qRpfmJ9ezJJAkXemDzGmoQ+rFySynuPw4T9PGNPWUScOtVnrUwdgh24cT
QTwp7p82BxEBpHL7+xhUu3aLksTdLWKiF3eITkMCpnW9KPNmTikE5pGEazYbIoJq7Yc9Qd4B
N8+7w+Z1v3sg934Rzxqve+TORnwsM319fnsi8yvSak4EyBtyNL7UZhzaaCxjIh4zqvD/Usmw
UPnLiY8Bn07eUHbzN/T7oIshHQo9/9g9QXK1Mzd/5T6IIMvvIMPNI/uZS5U+F/a7+8eH3TP3
HUmXT9mr4s9ov9m8PdzDZLnZ7eMbLpNjUIHd/pGuuAwcmiDevN//gKqxdSfp+nhhmCZnsFbb
H9uX/5w8u4+6yJ63dtDwrkjq41677EOzYCiqSFEqEZUhfRKGq9rnHALCkmAu+DFjFZTV9MPM
bRq6sZxUBZdufEc8tzGgGRH+r7zBl1IjSmQCHAm9bJ18tCYUnn/NVkpE90FnCnWZJwkhlywW
a9javsn4a0P1OqYA4yFZnojba/Qih89XSKR7YrFWfGUb0IreJmQkH4zWGqeraXpjxw8zYOig
IIG/i3g8u2LltZNploqXs+MobCY5IGa3aV+jzNj36EanvhsArdjs8cZ4/wIn3/PuZXvY7Sku
YAzW3yVEaFe5+7087nfbR8NxXBaUOaMoqeADOoln2W0Qp2ScTc9Qy0ZZYUAaginRpf6zl1BK
7n55ctjfP6CeBBWduWYiyqF1ZWvbbyndTjfL4cuoYN6oo4oxR2fNoZOYDXUglKTg/1no06yh
iNbOuDLpdLQCfWuPtnBQyLlmbL+3XhIHXh1C9TGgX0VG1QUa8A+eFpQe9sqJ4QmjS2hXXl2X
bnKRV/Gq9fzEJVWh35RxbWwSQDtrI4pDB8q5XfA5X8L5SAnnrND8r1kw0cH4mwVDAenM9/yF
5m+lDGPoSaBExgNunywi1DK7bQcRvkYwlit15R+ytztcJxFdopO1blHtVDXWfhOZ/MX0Kabz
Sm/iK3Tdg8/g1NCuZOl67F1IuWny2mPQet2Mjxi7UyTlGTp4lO9YLGjplTQjsBptIjDxE3ra
zurS6luVQjeip8pYxrgdzEvu8a4Hl03WVl4GOPGqQm8tEs03QtLhohEyvTgUF0bo3yaOKFFG
FieyNwxvkxPxJb2K5KEw/CZXNF7JrBfELq2diaiJeUFmHyehuElKN5P9rTALUGNobdO1Tb0F
BqNcF7zHqUr0QU31QVTZvkMDOyGWCeLF1yjYkwSyTG5NoAp7VJ0b80ymGUkRFGYNjM/pdXUi
CHLM0JdW4q2trIZUtE6L0UdpG8TUsUIhvWTpCV+jSZIv9Q7RwHEWMMpTGmgFPSsafwyYhrWH
PlNd4cT9w3dT6zKqxD5PHrodWsKD38s8/TO4DcS5Oxy7atCr/Ory8rO12/2VJzGjknQHX5BD
0ASR6n5VD7psKczMqz8jr/4zq+l6Ac04W9MKvjBSbjvIs/6Jkk74eRAWqBB9fvaFosc5Rh2H
28TXT9u33XR6cfX76Sd9yg/Qpo5oAX9WOzvIwPfQzZNM8tvm/XF38jfVbMetl0i4Nl2oibTb
tEscuPUhuXueR/dYlINlgUSn83Vi5Yp9hvYlMWxFTt5wxUuCMqR0Kq/DMjO8kZkv93VaOD+p
TVUSLD5i0czDOpnpGXRJorraHAnREbawU9dSe8OieTz3sjr21VcaA4v/8INJDFhfZFxJyTvq
RYSpsYjyEnXdiGxVxYIRWsTTQnEI0Pvgwtpf4Tea3Fn74mykVrORgrkT0y+9VC9V/panoFTK
UNPipvGqhQ5VKfLYU7zrcDExyHJjJirQwwI0OChaNBJP6Iw6hDA0pu9CFBINwnwz1r0Nt2Zt
n34nNXTc/JO787H8krucyG11R+Z1V9WMExSFOBdmJ2h9gi55xrFhOguDIKQUsIYBKb15iiGu
xZhJPz9n2mG94udRGmew8BlinvIfLgqedpOtzkeplzy1HCu0QPMJpsPW1S33WTOyjsqcW0kq
cre5pShiZJ6A+Pt2Yv0+s3+bO6xIO9fnEKZUS0bII+Et5cFQGPxlJt+AcOToOhW7ICPb2IHw
zAgTBBnV07x/4i9oodOCwG5mQLUzcBsayD1JunniGhy0aKx1DIPxv3CUXJy6gZUenMCwb8S5
ZuootkTrp6yn1jvQEleTEQm9Za2agE1WGt60xO92bjpg6VL5e5YfFgtmZ48t5jzurs7VhEG3
+Li4BMZYXMvD4Q3SzGMZetdtscSDmX6qE6imQKc2XEnWjivSBFNhpYmGOzUQqbQqxEAXHFTL
us2RQLKiGncRePwxz+0Dib4okkpxo18/vR/+nn7SKYrVbYHVNaa7TvtyRisBmSAmrK4BmjLW
YxaI7lgL9KHiPlBxTvHcAtFKLRboIxVnlPEsEK0rYIE+0gWXtPaQBaKVgwzQ1dkHcrr6yABf
MYpnJuj8A3WaMqqoCIKrJl7NWub+pWdzylk12ijqKEOMV/lxbK45VfypvawUge8DheAnikIc
bz0/RRSCH1WF4BeRQvBD1XfD8cacHm8NE1weIdd5PG1pi7ieTMcnQzK6igRGjvESphB+CNw8
/VY2QLI6bBgnKT2ozL06PlbYuoyT5Ehxcy88CilDxnhWIeCyn1gWEy4ma2KGodG771ij6qa8
jkkvUIhAaYnhXCCL/Zx0Dxbn7fJG15sx3oWkbsXm4X2/Pfx0fXXgiTwsVvyFvFHhGR47RHKJ
/sar7ppCM/jS1wfeZeCLEq6OzM24y5Lm6aVoNgx4CBDaYIExdqQfNS6Er3zNQG25Sjx512XM
vLwp7CiRlhN4tyH8VQZhFgZC4otyR8G7+Z4l+3FgtPAZmFWUHld5U3IuP/HJxRfZoFMHGYOJ
qFzvxbXvCt2GJ6nSr59Qxepx9+/Lbz/vn+9/+7G7f3zdvvz2dv/3BvLZPv6GZiVPOHU+yZl0
vdm/bH6ICE6bF3xNHWaUVGHbPO/2P0+2L9vD9v7H9n9VZC81V7NYOJX1r9sszwzBwtz3u+AA
6Imz8esEOVvbauoIfLYuQ1q3cgTfchynqG2eydHse5N5NFBgdNbAYpX2Ht1Lisx3cq8mYy/o
/gktL+XVTH8uEGqtQspppaVh6hdrOxXysJOKGzul9OLgElaVn9/q8ipYurl6xvf3P18Pu5MH
9LSx25983/x43eyHuSDB0LlzQ1PPSJ646aEX2AWKRBdaXftxsdDDKVgE9xO8RZGJLrTM5k7G
kEYC+1uHU3G2JtdFQTQe92Y3eVCKJdONd++OZK8r8sM2iCtvloTy5dHJfh6dTqYYFMRuVdYk
dCJVk0L8S9/4JEL8Q8nQVK809QKODadErLWTGGZzDAbYuX0q3r/92D78/s/m58mDmK1PGJXl
p/5ApEaxolVEOnLAXL67Qv1j9DIYzx828NtwcnFxarCXUqvn/fB983LYPtwfNo8n4YtoCEao
/Hd7+H7ivb3tHraCFNwf7p3l5+sRYNTAijSnCgs4+b3J5yJP1qdnjGVXvyDncWWFW7PWYHgT
OzsHBjvwYCO9VeMzEyrAz7tH3axR1WfmU7WMZnyhfl1Sn9S0LL6r0Yz4JClpPxAdOR+rREFX
fMW87av9IFwvS0a4qDodfcvVDaWcpRpTVUPfLu7fvnNdaziRV9tg6vnE+l1Bc8ZqdQufOXM2
2D5t3g5uuaV/pkf+M5Lb2yKtGnJmIp1v9WoltnW7PbPEuw4n1OhKysikgALr089BHNGVkbSu
vnwu865azo5ILDBrfw7OneakwQWVJqIEOOkxrDOhGUnNxDINuEiJGoIRFQ0ILvDEgDgjjZ/U
BrHwTt2TGxLJFgEBynNZgIV3cToh2ggE+hau6ExIQ0Wugcub5ZTumDp85uXp1cSp57KQ9ZEn
zPb1u2Ed0e+eFVFlSLVUsS161sxi8sPSpx7I+smeL9HOg1gfkqCE5cRU99IQruWU2kqPwBsj
/31Vj8xyJF861QrIzokcLsLaPhfeHcE4Vl5SwZE2ctqNzoKQfNrrqWUhw2+5k2tkPGo9zK9K
W+bkEHXpQw93MQWfX/ebtzfj5tX3XpTgq76dEz6SuhWdMlaQ/Ue0mGogL0aPBvuxVdqc3L88
7p5Psvfnb5u9tLsZwkPbM76KW78os5F1GJSzuTT2ciYSUphDTdLYJxUNBCzFeOFOuX/FGG8i
RN37Yk10OrLmaLx0tPweqO4zHwKXjL2XjcM7lTM43ZXux/bb/h4usPvd+2H7QjAQSTzrdjEi
HbYjiqUCEnHwUjC5No+iSJbZxQVMPdUxDKw/vsmfkoV8hBkeqkwzzy6aOc0WSycJ1eyzFZOs
hGnEHirIeJvsgkyM0ttCOgo/jut84xALCpBeDccFMNSje8IAxE74fD5+68LyYxFd2s+yi4sV
ZW+gYW9TuqsgXesrqhR/ESYVaZyqZ6NMTakcKi8KV74d/4koyQfW4mgPpSJCRTtf0fl51TrF
2MUAQWkpuj9z1/Jmf0CrKrgbvgk3Sm/bp5f7w/t+c/LwffPwz/blybSNRi0KXKIY+7bqZbyk
gOsjeasOnMWZV66lF9lIyY4SdoeRgiddIKVS2hmMIWzo5bWhcecJDWBi5GYwc0K0GtaU3JSF
EzB4mV+s26jMU6XIS0CSMGOoWYgaj3FiKBD4eRnEVFiQ3rDKj22zDEWykoU2Hmp/+Gmx8hdS
A6IMI31++zCZ4LDRl79/emki+nuMlhbXTWt+dWZJbiAB+Jsksh39mIAk9sPZekp8Kikc9yAg
Xrn0GBf5EjFjHmGAyjwZ+xYjrBO+EM2Arbi/kepYSqzRXTJ1Zw1eFuTpeEcBg9Wpx5n7MOq6
oaVIYmhg3snjykoF1m3YyZ/1VCpnYMroEoEXI7IRyRq+J6zuMHn4Xv5uV9NLJ02cCoWLjb3L
cyfRK1MqrV406cwhVIVXuvnO/L8M4xGZyozA0LZ2fhdrC0wjzIAwISnJXeqRBKFeSOFzJv3c
XfH6I5LasvDeqVsaACd56yWtmbzyytJbS4VLbceoqtyPZegpAdDUgD1hDaab5ckkETfZ2Hcw
PdAbncElqK2Eww0MADSvFxYNCZCFeLWy1YmR5gVB2dbt5TksaK1zgBJgSOsS45YvBMNM6CJH
eYnq2QBusv7pUNPjWsZ5nRhqo6JINAjlwjPPE9nzWjcLg335zKbtnkXTlkbfBDea4tw8yY1y
8ffYVpAlphYWOr0AblHLEVZ/FGidkIuwNHM4i/XIaFGe1ZrSm/aumJFyToGf/je1cpj+p58U
Fdqw5gkxAAVabxoPOD2pkT4K2yhpqoVlTeeAUh8ZJK1EmA2yc7VnT+Q3yD7sGQ+HbzBfLRVX
I1Jf99uXwz/CS9Tj8+btyX0dlxG+RWhyg6WQyaipRr+idFHqgUdLgMFI+uefLyziponD+msf
3jOFLkE9GyeHc20idzE02Im8Tmc5HLRtWJaA1PpWauTBny6Sua48wHZKL1rY/tj8ftg+d5zc
m4A+yPQ95VRHlsaYPYaZeGBKG5QToV2cNg1LqLQw2/sK94CpOQ8K2M7QajjlDNy9QGQMKBKw
AABwfqheWdOakXkBww4XP4AkcWbZkMk2VaGP+gdovJB6lvNgVVcLItqDBotrNzu5l0mFTriE
W2ryA2/90TEwfJx0SyDYfHt/Eh7o45e3w/79efNy0Ca8iG6GrH55MwyEltg/bMtx+/r5v1MK
JZ2y2xPOMDzxxCkEHXI9D4x9En8THTlsGLPK60wicXS8xDCyFFTic/mVl8TzLJUniePaZbSH
zJZIjWu7fWjDou4v3Qt/n5m+IIQGXbiqMQYfo0wgM0SgOIpodRsRB2GZMXIfQS7yGCMRMiKf
oZSWU5uQkHz2V+gz71NV0swUjAkMjwih68wp0HS9CkcJamW4K0NRSP5NrEShUtJUlkGSCI/T
ETEGEG+jLbO5pV5r+pnXYTBstOmWzSCwdZQOR4SeiPtxt+CRUTrSS6I1aOsYSWtKtx9cou+L
Blx7uAiGoLRqxYlk8amQcplKKsMUdra/heWATD7tIf4k372+/XaS7B7+eX+V29Pi/uXpzVwG
GWwYsDfmtH2vQUenBg3sNz0vBLfdpoCK1DAxdQ4ZQyS6xEH3LM9ruDR4qQ4UJVECAhZsVwdV
uz5UqgY8XqoN7kvVBgILaxcN8EW1V9Fze3kDpw6cPUFOC2vGR0wqEMI58/gugmJpO5qxypRx
gJGIp76zIJ2tYFBrIoqxZx0yY9dhWFibmpQaobbAsIH/8va6fUENAmjY8/th898G/rM5PPzx
xx+/DtUXJuYi77lgL13WuShhSSlTcrKLRR7YrpHNBW9STR2uQnof7dYU4VbN3EVkFu4OslxK
Gmy3+bLwmDjWXVWWVchwThIg2sMfPRKk3IcnMBpH8sKOFS8VHe9Oly1KhaWDcTj4oBRDQ0cv
Av+PqdDPWdwCazQ30rtXcGzQF3DDxAc/mNVSsjPS5Gt5YDJ74z+S0Xi8P9yfIIfxgHJRgmW2
A9vZR8YRejV26AtPBDHnXF4e5iI+Fcosy4bwlWBsHkyT7FL9Evovq4E3dL1yln5Ds0tAwOMx
4mcEIrhpo0HwfBXcvthD8qb+OjnV6c7IY2J4QzrWUG7ujEo7S/Km4+lLgps372Ji6gNPiNJ9
RqwJtV/AyZDIY74Olf8ueikBIPPXVphqJWrIC9nY0mLIoyaT15Vx6rz0igWNUZfSSHWmkYFI
hKs+OjoSuqNlYEHQmF6MECKBe81q+9Lgdx/KXAairA66Sm+tsmWpvul0UogSZk0U6U2AqzZU
DPGGTxHsaBwbGSLGabiWVWe0h2agZvlGfkrAZ2fUAV2TRbs32XHihkg7ysIwhdUMlzTRWMZV
VXkDHE/UfU9da8Xp7ma/WMLEIz4bpFByMLphpti+bhyrzBMB4/TcLVLPNNtWt2oXwxBSCzy9
hdG7rXCu0jHsKa6noPuAOZ97OMzOUaC8brBdp+IWxrk9T6+hiFnYjcuQ3NDJsyJy0tTqs9Pp
HJy1OoySmkZdo+mxxBp0dcYrRxmT5inMondmRO3BBl7wm/wC3xxHQ6LIjOQajjP7ADZhYmsZ
HgzpY0Vb1x9HHm2ItgRFTFoeqRrkJUKA7jqmVhOnyTiDpO6YRxlgXna9Yh3l9phbUGOspM8X
KhfXeKF75dXkr/Xm7YDMGF4u/N3/bPb3T5uBD+/v2ddoU2DfXeGKCsldlxTGixziqSMf5huc
86J7cXw6j8/DEXkdMJ4ERTw48cZd5YzDLAFhqXJVVLrjLnoFKX5T8LIjDI549xmhizeYPMlT
PBM4lPFaNDI/hYcOni7Z/stzhv9WKM1KhJ/g2IuLcGW717G6Wcr95fsLs/Q7XOUzVlUCcA2I
mvHcKABSB4GnyzeJUTqsNiaqoUA0je1sU6fKhzueriQ7PKLEV+gaZbMjHc7plQlqzERflYvi
emTF3Kb8jVE2HnXLWMM32YPFWPej7skC303gAKXZizgLcBSO7NddwMcyhbvdSEdJz04j7RH7
99iEFHZ6rCGjnJRpPjIj0EILOKrR1SEUXJgDQGXCAoDGLs/KS4skpJg0TSYq3LfGnbsK4+1V
2Ft2CH3jjXOT5lwFX3f/bvavD4z0HD1wdHZJS3FWUbJDAEmizgThkS+5syAs6sXXS+01bSGu
HYRoSssR414JRpETZqOFblugrE1/qByqgFGQ4Wo2C5M2Cj1xXxUiadNnHAPivZXWJUYvBZ7D
LTGt4m7X0olGq5ARQfkm8BgVX8gqNVkB/K1egxi4GKaqCtNZor1P6x+2ZS7CkltibMOWDcWh
cKWD+5dd8dArk/WINxbEFDV7tiA5Qv30MEPDGTIAqHoUdSekxe6QrM3/ATsPHRK3ogEA

--e2l4fr2wrbaq7jyz--
