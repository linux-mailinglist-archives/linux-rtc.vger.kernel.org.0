Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5221F93DB
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2020 11:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgFOJr4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Jun 2020 05:47:56 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:57366 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbgFOJrz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Jun 2020 05:47:55 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05F9lQtk031943;
        Mon, 15 Jun 2020 09:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=pDVacKwm7AUA4OUQOWR6PuaQoe5n1qVJqNv14UKSgm8=;
 b=HhPz8qlurOO5Jd3S4HGoVq4ZVZ4aOnpxai/iAssfmotbx/ID9pk0sheEjHOfbRreX5Uv
 jAyJH8/+QrXM3fTLx5cquRRyX3jJFNWfgtLwKBqEOZ9KOshaULVPbPRiUPZ2gXmTLjua
 BYrI/vO/0+2CSXWDQiZukbN5eAA9BX7eDg/TER6OK9PzXIdrWTr71+/2dMCJSnrgbOab
 PmNOl/rYp6p8Afm98aCCj5PDtfbUWeQu5aRIr/ji8BlAztRRvdbbBIUQAZ7FFjmCc2tu
 NiBxb9G7f1AEHNYfJP3NsgVaz5euzHZS0KGvvuiSLwBU0+4sHYiF6bz2cPgZNhbd6Qpt 0g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 31p6e5r288-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 Jun 2020 09:47:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05F9lOiZ194593;
        Mon, 15 Jun 2020 09:47:25 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 31n8qvj4q0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Jun 2020 09:47:24 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05F9lHkT004075;
        Mon, 15 Jun 2020 09:47:19 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 15 Jun 2020 02:47:14 -0700
Date:   Mon, 15 Jun 2020 12:47:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, "Kevin P. Fleming" <kevin+linux@km6g.us>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        "Kevin P. Fleming" <kevin+linux@km6g.us>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/3 v2] rtc: abx80x: Add support for autocalibration
 filter capacitor
Message-ID: <20200615094702.GI4151@kadam>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="YkJPYEFdoxh/AXLE"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200612223551.282113-3-kevin+linux@km6g.us>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9652 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9652 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1011
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006150079
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--YkJPYEFdoxh/AXLE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi "Kevin,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Kevin-P-Fleming/dt-bindings-abx80x-Add-autocal-filter-property/20200613-063944
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
config: i386-randconfig-m021-20200612 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/rtc/rtc-abx80x.c:821 abx80x_probe() error: uninitialized symbol 'trickle_cfg'.

# https://github.com/0day-ci/linux/commit/bbd3b3445f48810231c5f004a975116f19b37331
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout bbd3b3445f48810231c5f004a975116f19b37331
vim +/trickle_cfg +821 drivers/rtc/rtc-abx80x.c

4d61ff6b9960cb Philippe De Muyter 2015-05-05  700  static int abx80x_probe(struct i2c_client *client,
4d61ff6b9960cb Philippe De Muyter 2015-05-05  701  			const struct i2c_device_id *id)
4d61ff6b9960cb Philippe De Muyter 2015-05-05  702  {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  703  	struct device_node *np = client->dev.of_node;
af69f9a7878413 Jeremy Gebben      2018-09-11  704  	struct abx80x_priv *priv;
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  705  	int i, data, err, trickle_cfg, filter_cfg = -EINVAL;
                                                                          ^^^^^^^^^^^

4d61ff6b9960cb Philippe De Muyter 2015-05-05  706  	char buf[7];
4d61ff6b9960cb Philippe De Muyter 2015-05-05  707  	unsigned int part = id->driver_data;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  708  	unsigned int partnumber;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  709  	unsigned int majrev, minrev;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  710  	unsigned int lot;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  711  	unsigned int wafer;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  712  	unsigned int uid;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  713  
4d61ff6b9960cb Philippe De Muyter 2015-05-05  714  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
4d61ff6b9960cb Philippe De Muyter 2015-05-05  715  		return -ENODEV;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  716  
4d61ff6b9960cb Philippe De Muyter 2015-05-05  717  	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ID0,
4d61ff6b9960cb Philippe De Muyter 2015-05-05  718  					    sizeof(buf), buf);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  719  	if (err < 0) {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  720  		dev_err(&client->dev, "Unable to read partnumber\n");
4d61ff6b9960cb Philippe De Muyter 2015-05-05  721  		return -EIO;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  722  	}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  723  
4d61ff6b9960cb Philippe De Muyter 2015-05-05  724  	partnumber = (buf[0] << 8) | buf[1];
4d61ff6b9960cb Philippe De Muyter 2015-05-05  725  	majrev = buf[2] >> 3;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  726  	minrev = buf[2] & 0x7;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  727  	lot = ((buf[4] & 0x80) << 2) | ((buf[6] & 0x80) << 1) | buf[3];
4d61ff6b9960cb Philippe De Muyter 2015-05-05  728  	uid = ((buf[4] & 0x7f) << 8) | buf[5];
4d61ff6b9960cb Philippe De Muyter 2015-05-05  729  	wafer = (buf[6] & 0x7c) >> 2;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  730  	dev_info(&client->dev, "model %04x, revision %u.%u, lot %x, wafer %x, uid %x\n",
4d61ff6b9960cb Philippe De Muyter 2015-05-05  731  		 partnumber, majrev, minrev, lot, wafer, uid);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  732  
4d61ff6b9960cb Philippe De Muyter 2015-05-05  733  	data = i2c_smbus_read_byte_data(client, ABX8XX_REG_CTRL1);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  734  	if (data < 0) {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  735  		dev_err(&client->dev, "Unable to read control register\n");
4d61ff6b9960cb Philippe De Muyter 2015-05-05  736  		return -EIO;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  737  	}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  738  
4d61ff6b9960cb Philippe De Muyter 2015-05-05  739  	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_CTRL1,
718a820a303ca6 Alexandre Belloni  2015-12-17  740  					((data & ~(ABX8XX_CTRL_12_24 |
718a820a303ca6 Alexandre Belloni  2015-12-17  741  						   ABX8XX_CTRL_ARST)) |
4d61ff6b9960cb Philippe De Muyter 2015-05-05  742  					 ABX8XX_CTRL_WRITE));
4d61ff6b9960cb Philippe De Muyter 2015-05-05  743  	if (err < 0) {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  744  		dev_err(&client->dev, "Unable to write control register\n");
4d61ff6b9960cb Philippe De Muyter 2015-05-05  745  		return -EIO;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  746  	}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  747  
75455e258ea2b3 Marek Vasut        2019-01-29  748  	/* Configure RV1805 specifics */
75455e258ea2b3 Marek Vasut        2019-01-29  749  	if (part == RV1805) {
75455e258ea2b3 Marek Vasut        2019-01-29  750  		/*
75455e258ea2b3 Marek Vasut        2019-01-29  751  		 * Avoid accidentally entering test mode. This can happen
75455e258ea2b3 Marek Vasut        2019-01-29  752  		 * on the RV1805 in case the reserved bit 5 in control2
75455e258ea2b3 Marek Vasut        2019-01-29  753  		 * register is set. RV-1805-C3 datasheet indicates that
75455e258ea2b3 Marek Vasut        2019-01-29  754  		 * the bit should be cleared in section 11h - Control2.
75455e258ea2b3 Marek Vasut        2019-01-29  755  		 */
75455e258ea2b3 Marek Vasut        2019-01-29  756  		data = i2c_smbus_read_byte_data(client, ABX8XX_REG_CTRL2);
75455e258ea2b3 Marek Vasut        2019-01-29  757  		if (data < 0) {
75455e258ea2b3 Marek Vasut        2019-01-29  758  			dev_err(&client->dev,
75455e258ea2b3 Marek Vasut        2019-01-29  759  				"Unable to read control2 register\n");
75455e258ea2b3 Marek Vasut        2019-01-29  760  			return -EIO;
75455e258ea2b3 Marek Vasut        2019-01-29  761  		}
75455e258ea2b3 Marek Vasut        2019-01-29  762  
75455e258ea2b3 Marek Vasut        2019-01-29  763  		err = i2c_smbus_write_byte_data(client, ABX8XX_REG_CTRL2,
75455e258ea2b3 Marek Vasut        2019-01-29  764  						data & ~ABX8XX_CTRL2_RSVD);
75455e258ea2b3 Marek Vasut        2019-01-29  765  		if (err < 0) {
75455e258ea2b3 Marek Vasut        2019-01-29  766  			dev_err(&client->dev,
75455e258ea2b3 Marek Vasut        2019-01-29  767  				"Unable to write control2 register\n");
75455e258ea2b3 Marek Vasut        2019-01-29  768  			return -EIO;
75455e258ea2b3 Marek Vasut        2019-01-29  769  		}
75455e258ea2b3 Marek Vasut        2019-01-29  770  
75455e258ea2b3 Marek Vasut        2019-01-29  771  		/*
75455e258ea2b3 Marek Vasut        2019-01-29  772  		 * Avoid extra power leakage. The RV1805 uses smaller
75455e258ea2b3 Marek Vasut        2019-01-29  773  		 * 10pin package and the EXTI input is not present.
75455e258ea2b3 Marek Vasut        2019-01-29  774  		 * Disable it to avoid leakage.
75455e258ea2b3 Marek Vasut        2019-01-29  775  		 */
75455e258ea2b3 Marek Vasut        2019-01-29  776  		data = i2c_smbus_read_byte_data(client, ABX8XX_REG_OUT_CTRL);
75455e258ea2b3 Marek Vasut        2019-01-29  777  		if (data < 0) {
75455e258ea2b3 Marek Vasut        2019-01-29  778  			dev_err(&client->dev,
75455e258ea2b3 Marek Vasut        2019-01-29  779  				"Unable to read output control register\n");
75455e258ea2b3 Marek Vasut        2019-01-29  780  			return -EIO;
75455e258ea2b3 Marek Vasut        2019-01-29  781  		}
75455e258ea2b3 Marek Vasut        2019-01-29  782  
75455e258ea2b3 Marek Vasut        2019-01-29  783  		/*
75455e258ea2b3 Marek Vasut        2019-01-29  784  		 * Write the configuration key register to enable access to
75455e258ea2b3 Marek Vasut        2019-01-29  785  		 * the config2 register
75455e258ea2b3 Marek Vasut        2019-01-29  786  		 */
fee83bca1a1fde Kevin P. Fleming   2020-06-12  787  		if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_MISC) < 0)
75455e258ea2b3 Marek Vasut        2019-01-29  788  			return -EIO;
75455e258ea2b3 Marek Vasut        2019-01-29  789  
75455e258ea2b3 Marek Vasut        2019-01-29  790  		err = i2c_smbus_write_byte_data(client, ABX8XX_REG_OUT_CTRL,
75455e258ea2b3 Marek Vasut        2019-01-29  791  						data | ABX8XX_OUT_CTRL_EXDS);
75455e258ea2b3 Marek Vasut        2019-01-29  792  		if (err < 0) {
75455e258ea2b3 Marek Vasut        2019-01-29  793  			dev_err(&client->dev,
75455e258ea2b3 Marek Vasut        2019-01-29  794  				"Unable to write output control register\n");
75455e258ea2b3 Marek Vasut        2019-01-29  795  			return -EIO;
75455e258ea2b3 Marek Vasut        2019-01-29  796  		}
75455e258ea2b3 Marek Vasut        2019-01-29  797  	}
75455e258ea2b3 Marek Vasut        2019-01-29  798  
4d61ff6b9960cb Philippe De Muyter 2015-05-05  799  	/* part autodetection */
4d61ff6b9960cb Philippe De Muyter 2015-05-05  800  	if (part == ABX80X) {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  801  		for (i = 0; abx80x_caps[i].pn; i++)
4d61ff6b9960cb Philippe De Muyter 2015-05-05  802  			if (partnumber == abx80x_caps[i].pn)
4d61ff6b9960cb Philippe De Muyter 2015-05-05  803  				break;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  804  		if (abx80x_caps[i].pn == 0) {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  805  			dev_err(&client->dev, "Unknown part: %04x\n",
4d61ff6b9960cb Philippe De Muyter 2015-05-05  806  				partnumber);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  807  			return -EINVAL;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  808  		}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  809  		part = i;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  810  	}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  811  
4d61ff6b9960cb Philippe De Muyter 2015-05-05  812  	if (partnumber != abx80x_caps[part].pn) {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  813  		dev_err(&client->dev, "partnumber mismatch %04x != %04x\n",
4d61ff6b9960cb Philippe De Muyter 2015-05-05  814  			partnumber, abx80x_caps[part].pn);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  815  		return -EINVAL;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  816  	}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  817  
4d61ff6b9960cb Philippe De Muyter 2015-05-05  818  	if (np && abx80x_caps[part].has_tc)
6e429f6b8c6b8f Kevin P. Fleming   2020-05-30  819  		trickle_cfg = abx80x_dt_trickle_cfg(client);
                                                                ^^^^^^^^^^^^^
Not initialized on else path.

4d61ff6b9960cb Philippe De Muyter 2015-05-05  820  
4d61ff6b9960cb Philippe De Muyter 2015-05-05 @821  	if (trickle_cfg > 0) {
                                                            ^^^^^^^^^^^

4d61ff6b9960cb Philippe De Muyter 2015-05-05  822  		dev_info(&client->dev, "Enabling trickle charger: %02x\n",
4d61ff6b9960cb Philippe De Muyter 2015-05-05  823  			 trickle_cfg);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  824  		abx80x_enable_trickle_charger(client, trickle_cfg);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  825  	}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  826  
718a820a303ca6 Alexandre Belloni  2015-12-17  827  	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_CD_TIMER_CTL,
718a820a303ca6 Alexandre Belloni  2015-12-17  828  					BIT(2));
718a820a303ca6 Alexandre Belloni  2015-12-17  829  	if (err)
718a820a303ca6 Alexandre Belloni  2015-12-17  830  		return err;
718a820a303ca6 Alexandre Belloni  2015-12-17  831  
af69f9a7878413 Jeremy Gebben      2018-09-11  832  	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
af69f9a7878413 Jeremy Gebben      2018-09-11  833  	if (priv == NULL)
af69f9a7878413 Jeremy Gebben      2018-09-11  834  		return -ENOMEM;
af69f9a7878413 Jeremy Gebben      2018-09-11  835  
af69f9a7878413 Jeremy Gebben      2018-09-11  836  	priv->rtc = devm_rtc_allocate_device(&client->dev);
af69f9a7878413 Jeremy Gebben      2018-09-11  837  	if (IS_ERR(priv->rtc))
af69f9a7878413 Jeremy Gebben      2018-09-11  838  		return PTR_ERR(priv->rtc);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  839  
af69f9a7878413 Jeremy Gebben      2018-09-11  840  	priv->rtc->ops = &abx80x_rtc_ops;
af69f9a7878413 Jeremy Gebben      2018-09-11  841  	priv->client = client;
9360a6a81862d3 Alexandre Belloni  2017-10-13  842  
af69f9a7878413 Jeremy Gebben      2018-09-11  843  	i2c_set_clientdata(client, priv);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  844  
749e36d0a0d725 Jeremy Gebben      2018-09-11  845  	if (abx80x_caps[part].has_wdog) {
749e36d0a0d725 Jeremy Gebben      2018-09-11  846  		err = abx80x_setup_watchdog(priv);
749e36d0a0d725 Jeremy Gebben      2018-09-11  847  		if (err)
749e36d0a0d725 Jeremy Gebben      2018-09-11  848  			return err;
749e36d0a0d725 Jeremy Gebben      2018-09-11  849  	}
749e36d0a0d725 Jeremy Gebben      2018-09-11  850  
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  851  	if (of_property_read_u32(np, "abracon,autocal_filter", &filter_cfg) == 0) {
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  852  		err = abx80x_set_autocal_filter(client,
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  853  						filter_cfg ?
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  854  						ABX8XX_AUTOCAL_FILTER_ENABLE :
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  855  						ABX8XX_AUTOCAL_FILTER_DISABLE);
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  856  		if (err)
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  857  			return err;
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  858  	}
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  859  
718a820a303ca6 Alexandre Belloni  2015-12-17  860  	if (client->irq > 0) {
718a820a303ca6 Alexandre Belloni  2015-12-17  861  		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
718a820a303ca6 Alexandre Belloni  2015-12-17  862  		err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
718a820a303ca6 Alexandre Belloni  2015-12-17  863  						abx80x_handle_irq,
718a820a303ca6 Alexandre Belloni  2015-12-17  864  						IRQF_SHARED | IRQF_ONESHOT,
718a820a303ca6 Alexandre Belloni  2015-12-17  865  						"abx8xx",
718a820a303ca6 Alexandre Belloni  2015-12-17  866  						client);
718a820a303ca6 Alexandre Belloni  2015-12-17  867  		if (err) {
718a820a303ca6 Alexandre Belloni  2015-12-17  868  			dev_err(&client->dev, "unable to request IRQ, alarms disabled\n");
718a820a303ca6 Alexandre Belloni  2015-12-17  869  			client->irq = 0;
718a820a303ca6 Alexandre Belloni  2015-12-17  870  		}
718a820a303ca6 Alexandre Belloni  2015-12-17  871  	}
718a820a303ca6 Alexandre Belloni  2015-12-17  872  
559e883e0f7768 Alexandre Belloni  2019-03-06  873  	err = rtc_add_group(priv->rtc, &rtc_calib_attr_group);
59a8383adb7545 Mylène Josserand   2016-03-21  874  	if (err) {
59a8383adb7545 Mylène Josserand   2016-03-21  875  		dev_err(&client->dev, "Failed to create sysfs group: %d\n",
59a8383adb7545 Mylène Josserand   2016-03-21  876  			err);
59a8383adb7545 Mylène Josserand   2016-03-21  877  		return err;
59a8383adb7545 Mylène Josserand   2016-03-21  878  	}
59a8383adb7545 Mylène Josserand   2016-03-21  879  
559e883e0f7768 Alexandre Belloni  2019-03-06  880  	return rtc_register_device(priv->rtc);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  881  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--YkJPYEFdoxh/AXLE
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
SQA4e63qgZf8bmxFZ8o7y/8DwMSFag3tAQA=

--YkJPYEFdoxh/AXLE--
