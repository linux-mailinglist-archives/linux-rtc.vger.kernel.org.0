Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9E8129428
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2019 11:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfLWKZ2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Dec 2019 05:25:28 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:57277 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfLWKZ1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Dec 2019 05:25:27 -0500
X-Originating-IP: 176.184.22.51
Received: from localhost (did75-h03-176-184-22-51.dsl.sta.abo.bbox.fr [176.184.22.51])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D2195C0008;
        Mon, 23 Dec 2019 10:25:24 +0000 (UTC)
Date:   Mon, 23 Dec 2019 11:25:23 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Akshay Bhat <akshay.bhat@timesys.com>
Subject: Re: [PATCH] rtc: rx8010: Remove struct i2c_client from struct
 rx8010_data
Message-ID: <20191223102523.GJ1054858@piout.net>
References: <20191217121231.2698817-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217121231.2698817-1-iwamatsu@nigauri.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 17/12/2019 21:12:30+0900, Nobuhiro Iwamatsu wrote:
> The struct i2c_client can be obtained using to_i2c_client with struct
> device. This driver does not need to have it in struct rx8010_data.
> 
> CC: Alessandro Zummo <a.zummo@towertech.it>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> CC: Akshay Bhat <akshay.bhat@timesys.com>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  drivers/rtc/rtc-rx8010.c | 48 +++++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 25 deletions(-)
> 

This patch doesn't apply cleanly on rtc-next, can you rebase?

> diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
> index 8102469e27c05..c5d3ad2163475 100644
> --- a/drivers/rtc/rtc-rx8010.c
> +++ b/drivers/rtc/rtc-rx8010.c
> @@ -61,7 +61,6 @@ static const struct of_device_id rx8010_of_match[] = {
>  MODULE_DEVICE_TABLE(of, rx8010_of_match);
>  
>  struct rx8010_data {
> -	struct i2c_client *client;
>  	struct rtc_device *rtc;
>  	u8 ctrlreg;
>  };
> @@ -107,12 +106,12 @@ static irqreturn_t rx8010_irq_1_handler(int irq, void *dev_id)
>  
>  static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
>  {
> -	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
> +	struct i2c_client *client = to_i2c_client(dev);
>  	u8 date[7];
>  	int flagreg;
>  	int err;
>  
> -	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
> +	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
>  	if (flagreg < 0)
>  		return flagreg;
>  
> @@ -121,7 +120,7 @@ static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
>  		return -EINVAL;
>  	}
>  
> -	err = i2c_smbus_read_i2c_block_data(rx8010->client, RX8010_SEC,
> +	err = i2c_smbus_read_i2c_block_data(client, RX8010_SEC,
>  					    7, date);
>  	if (err != 7)
>  		return err < 0 ? err : -EIO;
> @@ -139,6 +138,7 @@ static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
>  
>  static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
>  {
> +	struct i2c_client *client = to_i2c_client(dev);
>  	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
>  	u8 date[7];
>  	int ctrl, flagreg;
> @@ -148,11 +148,11 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
>  		return -EINVAL;
>  
>  	/* set STOP bit before changing clock/calendar */
> -	ctrl = i2c_smbus_read_byte_data(rx8010->client, RX8010_CTRL);
> +	ctrl = i2c_smbus_read_byte_data(client, RX8010_CTRL);
>  	if (ctrl < 0)
>  		return ctrl;
>  	rx8010->ctrlreg = ctrl | RX8010_CTRL_STOP;
> -	ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
> +	ret = i2c_smbus_write_byte_data(client, RX8010_CTRL,
>  					rx8010->ctrlreg);
>  	if (ret < 0)
>  		return ret;
> @@ -165,28 +165,28 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
>  	date[RX8010_YEAR - RX8010_SEC] = bin2bcd(dt->tm_year - 100);
>  	date[RX8010_WDAY - RX8010_SEC] = bin2bcd(1 << dt->tm_wday);
>  
> -	ret = i2c_smbus_write_i2c_block_data(rx8010->client,
> +	ret = i2c_smbus_write_i2c_block_data(client,
>  					     RX8010_SEC, 7, date);
>  	if (ret < 0)
>  		return ret;
>  
>  	/* clear STOP bit after changing clock/calendar */
> -	ctrl = i2c_smbus_read_byte_data(rx8010->client, RX8010_CTRL);
> +	ctrl = i2c_smbus_read_byte_data(client, RX8010_CTRL);
>  	if (ctrl < 0)
>  		return ctrl;
>  	rx8010->ctrlreg = ctrl & ~RX8010_CTRL_STOP;
> -	ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
> +	ret = i2c_smbus_write_byte_data(client, RX8010_CTRL,
>  					rx8010->ctrlreg);
>  	if (ret < 0)
>  		return ret;
>  
> -	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
> +	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
>  	if (flagreg < 0) {
>  		return flagreg;
>  	}
>  
>  	if (flagreg & RX8010_FLAG_VLF)
> -		ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG,
> +		ret = i2c_smbus_write_byte_data(client, RX8010_FLAG,
>  						flagreg & ~RX8010_FLAG_VLF);
>  
>  	return 0;
> @@ -215,7 +215,7 @@ static int rx8010_init_client(struct i2c_client *client)
>  	if (err < 0)
>  		return err;
>  
> -	err = i2c_smbus_read_i2c_block_data(rx8010->client, RX8010_FLAG,
> +	err = i2c_smbus_read_i2c_block_data(client, RX8010_FLAG,
>  					    2, ctrl);
>  	if (err != 2)
>  		return err < 0 ? err : -EIO;
> @@ -248,8 +248,8 @@ static int rx8010_init_client(struct i2c_client *client)
>  
>  static int rx8010_read_alarm(struct device *dev, struct rtc_wkalrm *t)
>  {
> +	struct i2c_client *client = to_i2c_client(dev);
>  	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
> -	struct i2c_client *client = rx8010->client;
>  	u8 alarmvals[3];
>  	int flagreg;
>  	int err;
> @@ -290,7 +290,7 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
>  
>  	if (rx8010->ctrlreg & (RX8010_CTRL_AIE | RX8010_CTRL_UIE)) {
>  		rx8010->ctrlreg &= ~(RX8010_CTRL_AIE | RX8010_CTRL_UIE);
> -		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
> +		err = i2c_smbus_write_byte_data(client, RX8010_CTRL,
>  						rx8010->ctrlreg);
>  		if (err < 0) {
>  			return err;
> @@ -298,7 +298,7 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
>  	}
>  
>  	flagreg &= ~RX8010_FLAG_AF;
> -	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG, flagreg);
> +	err = i2c_smbus_write_byte_data(client, RX8010_FLAG, flagreg);
>  	if (err < 0)
>  		return err;
>  
> @@ -306,7 +306,7 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
>  	alarmvals[1] = bin2bcd(t->time.tm_hour);
>  	alarmvals[2] = bin2bcd(t->time.tm_mday);
>  
> -	err = i2c_smbus_write_i2c_block_data(rx8010->client, RX8010_ALMIN,
> +	err = i2c_smbus_write_i2c_block_data(client, RX8010_ALMIN,
>  					     2, alarmvals);
>  	if (err < 0)
>  		return err;
> @@ -316,14 +316,14 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
>  		return extreg;
>  
>  	extreg |= RX8010_EXT_WADA;
> -	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_EXT, extreg);
> +	err = i2c_smbus_write_byte_data(client, RX8010_EXT, extreg);
>  	if (err < 0)
>  		return err;
>  
>  	if (alarmvals[2] == 0)
>  		alarmvals[2] |= RX8010_ALARM_AE;
>  
> -	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_ALWDAY,
> +	err = i2c_smbus_write_byte_data(client, RX8010_ALWDAY,
>  					alarmvals[2]);
>  	if (err < 0)
>  		return err;
> @@ -335,7 +335,7 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
>  			rx8010->ctrlreg |=
>  				(RX8010_CTRL_AIE | RX8010_CTRL_UIE);
>  
> -		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
> +		err = i2c_smbus_write_byte_data(client, RX8010_CTRL,
>  						rx8010->ctrlreg);
>  		if (err < 0)
>  			return err;
> @@ -372,13 +372,13 @@ static int rx8010_alarm_irq_enable(struct device *dev,
>  		return flagreg;
>  
>  	flagreg &= ~RX8010_FLAG_AF;
> -	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG, flagreg);
> +	err = i2c_smbus_write_byte_data(client, RX8010_FLAG, flagreg);
>  	if (err < 0)
>  		return err;
>  
>  	if (ctrl != rx8010->ctrlreg) {
>  		rx8010->ctrlreg = ctrl;
> -		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
> +		err = i2c_smbus_write_byte_data(client, RX8010_CTRL,
>  						rx8010->ctrlreg);
>  		if (err < 0)
>  			return err;
> @@ -390,13 +390,12 @@ static int rx8010_alarm_irq_enable(struct device *dev,
>  static int rx8010_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> -	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
>  	int ret, tmp;
>  	int flagreg;
>  
>  	switch (cmd) {
>  	case RTC_VL_READ:
> -		flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
> +		flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
>  		if (flagreg < 0)
>  			return flagreg;
>  
> @@ -407,7 +406,7 @@ static int rx8010_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
>  		return 0;
>  
>  	case RTC_VL_CLR:
> -		flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
> +		flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
>  		if (flagreg < 0) {
>  			return flagreg;
>  		}
> @@ -448,7 +447,6 @@ static int rx8010_probe(struct i2c_client *client,
>  	if (!rx8010)
>  		return -ENOMEM;
>  
> -	rx8010->client = client;
>  	i2c_set_clientdata(client, rx8010);
>  
>  	err = rx8010_init_client(client);
> -- 
> 2.24.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
