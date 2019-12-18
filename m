Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBA1124284
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Dec 2019 10:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfLRJPP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Wed, 18 Dec 2019 04:15:15 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:59295 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfLRJPM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Dec 2019 04:15:12 -0500
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2180DC0012;
        Wed, 18 Dec 2019 09:15:08 +0000 (UTC)
Date:   Wed, 18 Dec 2019 10:15:08 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     linux-rtc@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH] rtc: pcf8563: Replace i2c functions for smbus ones
Message-ID: <20191218091508.GH695889@piout.net>
References: <20191218082604.3309606-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20191218082604.3309606-1-iwamatsu@nigauri.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 18/12/2019 17:26:04+0900, Nobuhiro Iwamatsu wrote:
> From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> 
> The driver used i2c_transfer methods to read and set date/time. The smbus
> methods should be used.
> This commit replaces i2c_transfer functions by i2c_smbus_read/write_xxx
> for reading and setting the datetime.
> 

Could you instead use regmap?

> CC: Alessandro Zummo <a.zummo@towertech.it>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  drivers/rtc/rtc-pcf8563.c | 144 ++++++++++++++------------------------
>  1 file changed, 52 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
> index 65e2bb5644768..77e22a386b5be 100644
> --- a/drivers/rtc/rtc-pcf8563.c
> +++ b/drivers/rtc/rtc-pcf8563.c
> @@ -21,6 +21,9 @@
>  #include <linux/err.h>
>  
>  #define PCF8563_REG_ST1		0x00 /* status */
> +#define PCF8563_TEST		BIT(7)
> +#define PCF8563_STOP		BIT(5)
> +#define PCF8563_TESTC		BIT(3)
>  #define PCF8563_REG_ST2		0x01
>  #define PCF8563_BIT_AIE		BIT(1)
>  #define PCF8563_BIT_AF		BIT(3)
> @@ -84,69 +87,21 @@ struct pcf8563 {
>  #endif
>  };
>  
> -static int pcf8563_read_block_data(struct i2c_client *client, unsigned char reg,
> -				   unsigned char length, unsigned char *buf)
> -{
> -	struct i2c_msg msgs[] = {
> -		{/* setup read ptr */
> -			.addr = client->addr,
> -			.len = 1,
> -			.buf = &reg,
> -		},
> -		{
> -			.addr = client->addr,
> -			.flags = I2C_M_RD,
> -			.len = length,
> -			.buf = buf
> -		},
> -	};
> -
> -	if ((i2c_transfer(client->adapter, msgs, 2)) != 2) {
> -		dev_err(&client->dev, "%s: read error\n", __func__);
> -		return -EIO;
> -	}
> -
> -	return 0;
> -}
> -
> -static int pcf8563_write_block_data(struct i2c_client *client,
> -				   unsigned char reg, unsigned char length,
> -				   unsigned char *buf)
> -{
> -	int i, err;
> -
> -	for (i = 0; i < length; i++) {
> -		unsigned char data[2] = { reg + i, buf[i] };
> -
> -		err = i2c_master_send(client, data, sizeof(data));
> -		if (err != sizeof(data)) {
> -			dev_err(&client->dev,
> -				"%s: err=%d addr=%02x, data=%02x\n",
> -				__func__, err, data[0], data[1]);
> -			return -EIO;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>  static int pcf8563_set_alarm_mode(struct i2c_client *client, bool on)
>  {
> -	unsigned char buf;
>  	int err;
>  
> -	err = pcf8563_read_block_data(client, PCF8563_REG_ST2, 1, &buf);
> +	err = i2c_smbus_read_byte_data(client, PCF8563_REG_ST2);
>  	if (err < 0)
>  		return err;
>  
>  	if (on)
> -		buf |= PCF8563_BIT_AIE;
> +		err |= PCF8563_BIT_AIE;
>  	else
> -		buf &= ~PCF8563_BIT_AIE;
> -
> -	buf &= ~(PCF8563_BIT_AF | PCF8563_BITS_ST2_N);
> +		err &= ~PCF8563_BIT_AIE;
>  
> -	err = pcf8563_write_block_data(client, PCF8563_REG_ST2, 1, &buf);
> +	err &= ~(PCF8563_BIT_AF | PCF8563_BITS_ST2_N);
> +	err = i2c_smbus_write_byte_data(client, PCF8563_REG_ST2, err);
>  	if (err < 0) {
>  		dev_err(&client->dev, "%s: write error\n", __func__);
>  		return -EIO;
> @@ -158,17 +113,16 @@ static int pcf8563_set_alarm_mode(struct i2c_client *client, bool on)
>  static int pcf8563_get_alarm_mode(struct i2c_client *client, unsigned char *en,
>  				  unsigned char *pen)
>  {
> -	unsigned char buf;
>  	int err;
>  
> -	err = pcf8563_read_block_data(client, PCF8563_REG_ST2, 1, &buf);
> -	if (err)
> +	err = i2c_smbus_read_byte_data(client, PCF8563_REG_ST2);
> +	if (err < 0)
>  		return err;
>  
>  	if (en)
> -		*en = !!(buf & PCF8563_BIT_AIE);
> +		*en = !!(err & PCF8563_BIT_AIE);
>  	if (pen)
> -		*pen = !!(buf & PCF8563_BIT_AF);
> +		*pen = !!(err & PCF8563_BIT_AF);
>  
>  	return 0;
>  }
> @@ -203,8 +157,8 @@ static int pcf8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	unsigned char buf[9];
>  	int err;
>  
> -	err = pcf8563_read_block_data(client, PCF8563_REG_ST1, 9, buf);
> -	if (err)
> +	err = i2c_smbus_read_i2c_block_data(client, PCF8563_REG_ST1, 9, buf);
> +	if (err < 0)
>  		return err;
>  
>  	if (buf[PCF8563_REG_SC] & PCF8563_SC_LV) {
> @@ -245,6 +199,7 @@ static int pcf8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  
>  static int pcf8563_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  {
> +	int ret;
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct pcf8563 *pcf8563 = i2c_get_clientdata(client);
>  	unsigned char buf[9];
> @@ -272,8 +227,20 @@ static int pcf8563_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  
>  	buf[PCF8563_REG_DW] = tm->tm_wday & 0x07;
>  
> -	return pcf8563_write_block_data(client, PCF8563_REG_SC,
> -				9 - PCF8563_REG_SC, buf + PCF8563_REG_SC);
> +	ret = i2c_smbus_write_byte_data(client, PCF8563_REG_ST1,
> +						PCF8563_STOP);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_i2c_block_data(client, PCF8563_REG_SC, 7, buf + 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PCF8563_REG_ST1, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
>  }
>  
>  #ifdef CONFIG_RTC_INTF_DEV
> @@ -320,8 +287,8 @@ static int pcf8563_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
>  	unsigned char buf[4];
>  	int err;
>  
> -	err = pcf8563_read_block_data(client, PCF8563_REG_AMN, 4, buf);
> -	if (err)
> +	err = i2c_smbus_read_i2c_block_data(client, PCF8563_REG_AMN, 4, buf);
> +	if (err < 0)
>  		return err;
>  
>  	dev_dbg(&client->dev,
> @@ -369,8 +336,7 @@ static int pcf8563_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
>  	buf[1] = bin2bcd(tm->time.tm_hour);
>  	buf[2] = bin2bcd(tm->time.tm_mday);
>  	buf[3] = tm->time.tm_wday & 0x07;
> -
> -	err = pcf8563_write_block_data(client, PCF8563_REG_AMN, 4, buf);
> +	err = i2c_smbus_write_i2c_block_data(client, PCF8563_REG_AMN, 4, buf);
>  	if (err)
>  		return err;
>  
> @@ -402,14 +368,13 @@ static unsigned long pcf8563_clkout_recalc_rate(struct clk_hw *hw,
>  {
>  	struct pcf8563 *pcf8563 = clkout_hw_to_pcf8563(hw);
>  	struct i2c_client *client = pcf8563->client;
> -	unsigned char buf;
> -	int ret = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
> +	int ret = i2c_smbus_read_byte_data(client, PCF8563_REG_CLKO);
>  
>  	if (ret < 0)
>  		return 0;
>  
> -	buf &= PCF8563_REG_CLKO_F_MASK;
> -	return clkout_rates[buf];
> +	ret &= PCF8563_REG_CLKO_F_MASK;
> +	return clkout_rates[ret];
>  }
>  
>  static long pcf8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
> @@ -420,7 +385,6 @@ static long pcf8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
>  	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
>  		if (clkout_rates[i] <= rate)
>  			return clkout_rates[i];
> -
>  	return 0;
>  }
>  
> @@ -429,20 +393,18 @@ static int pcf8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
>  {
>  	struct pcf8563 *pcf8563 = clkout_hw_to_pcf8563(hw);
>  	struct i2c_client *client = pcf8563->client;
> -	unsigned char buf;
> -	int ret = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
>  	int i;
> +	int ret = i2c_smbus_read_byte_data(client, PCF8563_REG_CLKO);
>  
>  	if (ret < 0)
>  		return ret;
>  
>  	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
>  		if (clkout_rates[i] == rate) {
> -			buf &= ~PCF8563_REG_CLKO_F_MASK;
> -			buf |= i;
> -			ret = pcf8563_write_block_data(client,
> -						       PCF8563_REG_CLKO, 1,
> -						       &buf);
> +			ret &= ~PCF8563_REG_CLKO_F_MASK;
> +			ret |= i;
> +			ret =  i2c_smbus_write_byte_data(client,
> +						PCF8563_REG_CLKO, ret);
>  			return ret;
>  		}
>  
> @@ -453,19 +415,20 @@ static int pcf8563_clkout_control(struct clk_hw *hw, bool enable)
>  {
>  	struct pcf8563 *pcf8563 = clkout_hw_to_pcf8563(hw);
>  	struct i2c_client *client = pcf8563->client;
> -	unsigned char buf;
> -	int ret = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
> +	int ret = i2c_smbus_read_byte_data(client, PCF8563_REG_CLKO);
>  
>  	if (ret < 0)
>  		return ret;
>  
>  	if (enable)
> -		buf |= PCF8563_REG_CLKO_FE;
> +		ret |= PCF8563_REG_CLKO_FE;
>  	else
> -		buf &= ~PCF8563_REG_CLKO_FE;
> +		ret &= ~PCF8563_REG_CLKO_FE;
> +	ret =  i2c_smbus_write_byte_data(client, PCF8563_REG_CLKO, ret);
> +	if (ret < 0)
> +		return ret;
>  
> -	ret = pcf8563_write_block_data(client, PCF8563_REG_CLKO, 1, &buf);
> -	return ret;
> +	return 0;
>  }
>  
>  static int pcf8563_clkout_prepare(struct clk_hw *hw)
> @@ -482,13 +445,12 @@ static int pcf8563_clkout_is_prepared(struct clk_hw *hw)
>  {
>  	struct pcf8563 *pcf8563 = clkout_hw_to_pcf8563(hw);
>  	struct i2c_client *client = pcf8563->client;
> -	unsigned char buf;
> -	int ret = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
> +	int ret = i2c_smbus_read_byte_data(client, PCF8563_REG_CLKO);
>  
>  	if (ret < 0)
>  		return ret;
>  
> -	return !!(buf & PCF8563_REG_CLKO_FE);
> +	return !!(ret & PCF8563_REG_CLKO_FE);
>  }
>  
>  static const struct clk_ops pcf8563_clkout_ops = {
> @@ -507,11 +469,9 @@ static struct clk *pcf8563_clkout_register_clk(struct pcf8563 *pcf8563)
>  	struct clk *clk;
>  	struct clk_init_data init;
>  	int ret;
> -	unsigned char buf;
>  
>  	/* disable the clkout output */
> -	buf = 0;
> -	ret = pcf8563_write_block_data(client, PCF8563_REG_CLKO, 1, &buf);
> +	ret =  i2c_smbus_write_byte_data(client, PCF8563_REG_CLKO, 0);
>  	if (ret < 0)
>  		return ERR_PTR(ret);
>  
> @@ -567,7 +527,7 @@ static int pcf8563_probe(struct i2c_client *client,
>  
>  	/* Set timer to lowest frequency to save power (ref Haoyu datasheet) */
>  	buf = PCF8563_TMRC_1_60;
> -	err = pcf8563_write_block_data(client, PCF8563_REG_TMRC, 1, &buf);
> +	err = i2c_smbus_write_byte_data(client, PCF8563_REG_TMRC, buf);
>  	if (err < 0) {
>  		dev_err(&client->dev, "%s: write error\n", __func__);
>  		return err;
> @@ -575,7 +535,7 @@ static int pcf8563_probe(struct i2c_client *client,
>  
>  	/* Clear flags and disable interrupts */
>  	buf = 0;
> -	err = pcf8563_write_block_data(client, PCF8563_REG_ST2, 1, &buf);
> +	err = i2c_smbus_write_byte_data(client, PCF8563_REG_ST2, buf);
>  	if (err < 0) {
>  		dev_err(&client->dev, "%s: write error\n", __func__);
>  		return err;
> -- 
> 2.24.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
