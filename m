Return-Path: <linux-rtc+bounces-2930-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBC0A1351C
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 09:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3222188066A
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 08:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3AE198823;
	Thu, 16 Jan 2025 08:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwC0SLkp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07654148314;
	Thu, 16 Jan 2025 08:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737015391; cv=none; b=ZHF9K3tAZq9o70XXyqYvxOuTXHiWeIN/UVuIjAWQs6fkcjjlmsMHuHTZymJHHNRkSCBIFo1lb2Ca/AqU5jyw24LxOKxehdy7OWE9Z+e8XGH1Ud8DgFwT3QXyFvKSoJS+OcgdSIJHnxBAFQ9oEyTILWxNNz4IoY7rOX48z6IfeC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737015391; c=relaxed/simple;
	bh=eAhEP3Hbv3ryM+yrOjS9skac+Whdwyp4gG2ASwk0Xys=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=feWs6A7soRXC7aDqindiTwK6mdMuTY84KidfE7lTtvDlK2MYDGkp0lDHSc+ikJ5gnN9k35VkCcM4qQfk2MdjsLDcH9hDz116ypG3T71AO39bZaEzWsZGAIMF/44JmDT2TGeAy6LJaLnqWf3Gt4ZrzdW0fn5aya1tH92NGYUFsl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwC0SLkp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so5252205e9.2;
        Thu, 16 Jan 2025 00:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737015385; x=1737620185; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1n2cGvxlVycZsXUu6whQPNqJCFkjg1SpM5JStzP2FLc=;
        b=jwC0SLkpw2I7oCQrdz7Utd61cPAGMuUp6+79pcPyjfwBA2Z+ndSHstoVX9FHVGAdBO
         J7pb86luSv6cnAHMyJRuBpMQu28dM2OVeZ4x71pj2jw19o9n4UnTG++8+KgFIAPfkavx
         qe+vCwLzvBO8FUVb7YvQhXOgkf6NDQQ83aQDm3Dqz0eFE4BiOl92ZRyk+fNvKRm+MFuE
         4ZRx4qfSK/Jp+plxUFWYm2cGeMDvblkuGUTui4qINfDba5gfu9ceBU1oaMB1sujenZdS
         CONB/B/k1DhSoAorxVWTIF4BHVGKJE0ajxnC9MynF+vxXaAhHIKgSer3ctBbfhF0sAse
         TGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737015385; x=1737620185;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1n2cGvxlVycZsXUu6whQPNqJCFkjg1SpM5JStzP2FLc=;
        b=ju0aDvQpHvjqYtz6Dc7VIKmawFbY9VlOj9H/b0z7eOw+pahnNC5vlgZ/LgalZAHKXI
         OBbaTLBAsaDJH1HPzCfwR66s4mQCKQA7iZ/zeurbbFXrbXWgpq0hswwv+z1chr+AngZq
         G38EpH8bQNVXF2UUzvH67rxxDOUt0d7boTUa+HbOf2VG063tsOBRA0WTxYmjCqPAUSYU
         le5GJ8su7uBOPqxH0hHuTFOY6XB+HMWcOKYF2mpPkcOq52B71bTyuZyTDimNz2grhXno
         rPiQn2bZwOw/OHb6GmGAaN1w1k0qGtf4ozP7fEbnA8SS48ceaYKRTNoHP1gJ2Z5WZS5K
         FwZw==
X-Forwarded-Encrypted: i=1; AJvYcCVlAwjgoPgy5Eib0br2X90BtD+LDaFt9Jl+iWGpRiICProc+PIkZ0PFReLATTonCDoaPrtSq8m6+W/6MQcn@vger.kernel.org, AJvYcCXZ3GDZ014UkGIlNBZRgNGyf97oBUNdUzjHXUztwp1Pevj7MJNEf8v3tue71Fd0mBPw15mUH/z53I3H@vger.kernel.org, AJvYcCXuMTnVg2Hb3lxbWUFWmt6nxSygL5S1Ku8a9AgzIs+0jAKLp/mP3CcT4uTqAm14aBL7k+kW1vy2grt5Im0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxHGswWjaYI1qrLqqo50IxR7L3ulYq1el7gSs6sbmndEoT89NK
	fsHFUyjbn4EM6vYetHYECwNlQiR7O6/nNYRok2X+xg7SPTn/FDzZ
X-Gm-Gg: ASbGncuay1aCMIqWIcaX3UfSe6O3JgjOm7xQP/3MaMW2bv/Iplq7oMjIRRZQyry/ia4
	kukSrgzy94PiMdwATiGGeMMXfbY3XBF60mTq5Dhe/GYjMBfAhra7ETBJ0FM7atqoVMLEuD9QVw2
	cYtGlI/qNrqwiuZRC8AvWTU3iTbE91wJ6BWx6MbUZd5ulcKEL1AU7tbzMdlnIP9C7bru6uGjjzT
	mOgZmXHqk3aTAyJ2SkQaey+fuAYADfZDtxzmjkTA1IWWHGK3A5C+WhlMO15T6BmFfYGQkLAzBYE
	IozFcxPK4J2rOeb0DFAkUj4XNw9u
X-Google-Smtp-Source: AGHT+IHGqjKPPzXeaTvkcuNAWqsQtzHnRGn3M/MtYg5aTr2WHYlZex7pGpW3zccSYRZlUL730LY3Pg==
X-Received: by 2002:a05:600c:3ca4:b0:434:a10f:9b with SMTP id 5b1f17b1804b1-436e26ab2a2mr330202315e9.14.1737015384958;
        Thu, 16 Jan 2025 00:16:24 -0800 (PST)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c0f03984sm57231135e9.0.2025.01.16.00.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:16:24 -0800 (PST)
Message-ID: <f30b5ceb77e44e7b74fd19b0c620d27a3c612e94.camel@gmail.com>
Subject: Re: [PATCH v3 2/2] rtc: max31335: Add driver support for max31331
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: pavithra.u@analog.com, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jean Delvare	 <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Christophe JAILLET	 <christophe.jaillet@wanadoo.fr>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Date: Thu, 16 Jan 2025 08:16:25 +0000
In-Reply-To: <20250109-add_support_max31331_fix_3-v1-2-a74fac29bf49@analog.com>
References: 
	<20250109-add_support_max31331_fix_3-v1-0-a74fac29bf49@analog.com>
	 <20250109-add_support_max31331_fix_3-v1-2-a74fac29bf49@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-01-09 at 15:59 +0530, PavithraUdayakumar-adi via B4 Relay wrot=
e:
> From: PavithraUdayakumar-adi <pavithra.u@analog.com>
>=20
> MAX31331 is an ultra-low-power, I2C Real-Time Clock RTC.
>=20
> Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>
> ---
> =C2=A0drivers/rtc/rtc-max31335.c | 163 +++++++++++++++++++++++++++++++++-=
----------
> -
> =C2=A01 file changed, 120 insertions(+), 43 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
> index
> 3fbcf5f6b92ffd4581e9c4dbc87ec848867522dc..9d8f220fba2b21fc6393d67bff47f99=
b0227
> c707 100644
> --- a/drivers/rtc/rtc-max31335.c
> +++ b/drivers/rtc/rtc-max31335.c
> @@ -184,31 +184,88 @@
> =C2=A0#define MAX31335_RAM_SIZE			32
> =C2=A0#define MAX31335_TIME_SIZE			0x07
> =C2=A0
> +/* MAX31331 Register Map */
> +#define MAX31331_RTC_CONFIG2			0x04
> +
> =C2=A0#define clk_hw_to_max31335(_hw) container_of(_hw, struct max31335_d=
ata,
> clkout)
> =C2=A0
> +/* Supported Maxim RTC */
> +enum max_rtc_ids {
> +	ID_MAX31331,
> +	ID_MAX31335,
> +	MAX_RTC_ID_NR
> +};
> +
> +struct chip_desc {
> +	u8 sec_reg;
> +	u8 alarm1_sec_reg;
> +
> +	u8 int_en_reg;
> +	u8 int_status_reg;
> +
> +	u8 ram_reg;
> +	u8 ram_size;
> +
> +	u8 temp_reg;
> +
> +	u8 trickle_reg;
> +
> +	u8 clkout_reg;
> +};
> +
> =C2=A0struct max31335_data {
> +	enum max_rtc_ids id;
> =C2=A0	struct regmap *regmap;
> =C2=A0	struct rtc_device *rtc;
> =C2=A0	struct clk_hw clkout;
> +	struct clk *clkin;
> +	const struct chip_desc *chip;
> +	int irq;
> =C2=A0};
> =C2=A0
> =C2=A0static const int max31335_clkout_freq[] =3D { 1, 64, 1024, 32768 };
> =C2=A0
> +static const struct chip_desc chip[MAX_RTC_ID_NR] =3D {
> +	[ID_MAX31331] =3D {
> +		.int_en_reg =3D 0x01,
> +		.int_status_reg =3D 0x00,
> +		.sec_reg =3D 0x08,
> +		.alarm1_sec_reg =3D 0x0F,
> +		.ram_reg =3D 0x20,
> +		.ram_size =3D 32,
> +		.trickle_reg =3D 0x1B,
> +		.clkout_reg =3D 0x04,
> +	},
> +	[ID_MAX31335] =3D {
> +		.int_en_reg =3D 0x01,
> +		.int_status_reg =3D 0x00,
> +		.sec_reg =3D 0x0A,
> +		.alarm1_sec_reg =3D 0x11,
> +		.ram_reg =3D 0x40,
> +		.ram_size =3D 32,
> +		.temp_reg =3D 0x35,
> +		.trickle_reg =3D 0x1D,
> +		.clkout_reg =3D 0x06,
> +	},
> +};
> +
> =C2=A0static const u16 max31335_trickle_resistors[] =3D {3000, 6000, 1100=
0};
> =C2=A0
> =C2=A0static bool max31335_volatile_reg(struct device *dev, unsigned int =
reg)
> =C2=A0{
> +	struct max31335_data *max31335 =3D dev_get_drvdata(dev);
> +	const struct chip_desc *chip =3D max31335->chip;
> +
> =C2=A0	/* time keeping registers */
> -	if (reg >=3D MAX31335_SECONDS &&
> -	=C2=A0=C2=A0=C2=A0 reg < MAX31335_SECONDS + MAX31335_TIME_SIZE)
> +	if (reg >=3D chip->sec_reg && reg < chip->sec_reg + MAX31335_TIME_SIZE)
> =C2=A0		return true;
> =C2=A0
> =C2=A0	/* interrupt status register */
> -	if (reg =3D=3D MAX31335_STATUS1)
> +	if (reg =3D=3D chip->int_status_reg)
> =C2=A0		return true;
> =C2=A0
> -	/* temperature registers */
> -	if (reg =3D=3D MAX31335_TEMP_DATA_MSB || reg =3D=3D MAX31335_TEMP_DATA_=
LSB)
> +	/* temperature registers if valid */
> +	if (chip->temp_reg && (reg =3D=3D chip->temp_reg || reg =3D=3D chip->te=
mp_reg
> + 1))
> =C2=A0		return true;
> =C2=A0
> =C2=A0	return false;
> @@ -227,7 +284,7 @@ static int max31335_read_time(struct device *dev, str=
uct
> rtc_time *tm)
> =C2=A0	u8 date[7];
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D regmap_bulk_read(max31335->regmap, MAX31335_SECONDS, date,
> +	ret =3D regmap_bulk_read(max31335->regmap, max31335->chip->sec_reg,
> date,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(date));
> =C2=A0	if (ret)
> =C2=A0		return ret;
> @@ -262,7 +319,7 @@ static int max31335_set_time(struct device *dev, stru=
ct
> rtc_time *tm)
> =C2=A0	if (tm->tm_year >=3D 200)
> =C2=A0		date[5] |=3D FIELD_PREP(MAX31335_MONTH_CENTURY, 1);
> =C2=A0
> -	return regmap_bulk_write(max31335->regmap, MAX31335_SECONDS, date,
> +	return regmap_bulk_write(max31335->regmap, max31335->chip->sec_reg,
> date,
> =C2=A0				 sizeof(date));
> =C2=A0}
> =C2=A0
> @@ -273,7 +330,7 @@ static int max31335_read_alarm(struct device *dev, st=
ruct
> rtc_wkalrm *alrm)
> =C2=A0	struct rtc_time time;
> =C2=A0	u8 regs[6];
> =C2=A0
> -	ret =3D regmap_bulk_read(max31335->regmap, MAX31335_ALM1_SEC, regs,
> +	ret =3D regmap_bulk_read(max31335->regmap, max31335->chip-
> >alarm1_sec_reg, regs,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(regs));
> =C2=A0	if (ret)
> =C2=A0		return ret;
> @@ -292,11 +349,11 @@ static int max31335_read_alarm(struct device *dev,
> struct rtc_wkalrm *alrm)
> =C2=A0	if (time.tm_year >=3D 200)
> =C2=A0		alrm->time.tm_year +=3D 100;
> =C2=A0
> -	ret =3D regmap_read(max31335->regmap, MAX31335_INT_EN1, &ctrl);
> +	ret =3D regmap_read(max31335->regmap, max31335->chip->int_en_reg,
> &ctrl);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	ret =3D regmap_read(max31335->regmap, MAX31335_STATUS1, &status);
> +	ret =3D regmap_read(max31335->regmap, max31335->chip->int_status_reg,
> &status);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> @@ -320,18 +377,18 @@ static int max31335_set_alarm(struct device *dev, s=
truct
> rtc_wkalrm *alrm)
> =C2=A0	regs[4] =3D bin2bcd(alrm->time.tm_mon + 1);
> =C2=A0	regs[5] =3D bin2bcd(alrm->time.tm_year % 100);
> =C2=A0
> -	ret =3D regmap_bulk_write(max31335->regmap, MAX31335_ALM1_SEC,
> +	ret =3D regmap_bulk_write(max31335->regmap, max31335->chip-
> >alarm1_sec_reg,
> =C2=A0				regs, sizeof(regs));
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	reg =3D FIELD_PREP(MAX31335_INT_EN1_A1IE, alrm->enabled);
> -	ret =3D regmap_update_bits(max31335->regmap, MAX31335_INT_EN1,
> +	ret =3D regmap_update_bits(max31335->regmap, max31335->chip-
> >int_en_reg,
> =C2=A0				 MAX31335_INT_EN1_A1IE, reg);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	ret =3D regmap_update_bits(max31335->regmap, MAX31335_STATUS1,
> +	ret =3D regmap_update_bits(max31335->regmap, max31335->chip-
> >int_status_reg,
> =C2=A0				 MAX31335_STATUS1_A1F, 0);
> =C2=A0
> =C2=A0	return 0;
> @@ -341,23 +398,33 @@ static int max31335_alarm_irq_enable(struct device =
*dev,
> unsigned int enabled)
> =C2=A0{
> =C2=A0	struct max31335_data *max31335 =3D dev_get_drvdata(dev);
> =C2=A0
> -	return regmap_update_bits(max31335->regmap, MAX31335_INT_EN1,
> +	return regmap_update_bits(max31335->regmap, max31335->chip-
> >int_en_reg,
> =C2=A0				=C2=A0 MAX31335_INT_EN1_A1IE, enabled);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t max31335_handle_irq(int irq, void *dev_id)
> =C2=A0{
> =C2=A0	struct max31335_data *max31335 =3D dev_id;
> -	bool status;
> -	int ret;
> +	struct mutex *lock =3D &max31335->rtc->ops_lock;
> +	int ret, status;
> +
> +	mutex_lock(lock);
> =C2=A0
> -	ret =3D regmap_update_bits_check(max31335->regmap, MAX31335_STATUS1,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX31335_STATUS1_A1F, 0, &statu=
s);
> +	ret =3D regmap_read(max31335->regmap, max31335->chip->int_status_reg,
> &status);
> =C2=A0	if (ret)
> -		return IRQ_HANDLED;
> +		goto exit;
> +
> +	if (FIELD_GET(MAX31335_STATUS1_A1F, status)) {
> +		ret =3D regmap_update_bits(max31335->regmap, max31335->chip-
> >int_status_reg,
> +					 MAX31335_STATUS1_A1F, 0);
> +		if (ret)
> +			goto exit;
> =C2=A0
> -	if (status)
> =C2=A0		rtc_update_irq(max31335->rtc, 1, RTC_AF | RTC_IRQF);
> +	}
> +
> +exit:
> +	mutex_unlock(lock);
> =C2=A0
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> @@ -404,7 +471,7 @@ static int max31335_trickle_charger_setup(struct devi=
ce
> *dev,
> =C2=A0
> =C2=A0	i =3D i + trickle_cfg;
> =C2=A0
> -	return regmap_write(max31335->regmap, MAX31335_TRICKLE_REG,
> +	return regmap_write(max31335->regmap, max31335->chip->trickle_reg,
> =C2=A0			=C2=A0=C2=A0=C2=A0 FIELD_PREP(MAX31335_TRICKLE_REG_TRICKLE, i) |
> =C2=A0			=C2=A0=C2=A0=C2=A0 FIELD_PREP(MAX31335_TRICKLE_REG_EN_TRICKLE,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chargeable));
> @@ -418,7 +485,7 @@ static unsigned long max31335_clkout_recalc_rate(stru=
ct
> clk_hw *hw,
> =C2=A0	unsigned int reg;
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D regmap_read(max31335->regmap, MAX31335_RTC_CONFIG2, &reg);
> +	ret =3D regmap_read(max31335->regmap, max31335->chip->clkout_reg,
> &reg);
> =C2=A0	if (ret)
> =C2=A0		return 0;
> =C2=A0
> @@ -449,23 +516,23 @@ static int max31335_clkout_set_rate(struct clk_hw *=
hw,
> unsigned long rate,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(max31335_clkout_freq));
> =C2=A0	freq_mask =3D __roundup_pow_of_two(ARRAY_SIZE(max31335_clkout_freq=
)) -
> 1;
> =C2=A0
> -	return regmap_update_bits(max31335->regmap, MAX31335_RTC_CONFIG2,
> -				=C2=A0 freq_mask, index);
> +	return regmap_update_bits(max31335->regmap, max31335->chip-
> >clkout_reg,
> +				 freq_mask, index);
> =C2=A0}
> =C2=A0
> =C2=A0static int max31335_clkout_enable(struct clk_hw *hw)
> =C2=A0{
> =C2=A0	struct max31335_data *max31335 =3D clk_hw_to_max31335(hw);
> =C2=A0
> -	return regmap_set_bits(max31335->regmap, MAX31335_RTC_CONFIG2,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX31335_RTC_CONFIG2_ENCLKO);
> +	return regmap_set_bits(max31335->regmap, max31335->chip->clkout_reg,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX31335_RTC_CONFIG2_ENCLKO);
> =C2=A0}
> =C2=A0
> =C2=A0static void max31335_clkout_disable(struct clk_hw *hw)
> =C2=A0{
> =C2=A0	struct max31335_data *max31335 =3D clk_hw_to_max31335(hw);
> =C2=A0
> -	regmap_clear_bits(max31335->regmap, MAX31335_RTC_CONFIG2,
> +	regmap_clear_bits(max31335->regmap, max31335->chip->clkout_reg,
> =C2=A0			=C2=A0 MAX31335_RTC_CONFIG2_ENCLKO);
> =C2=A0}
> =C2=A0
> @@ -475,7 +542,7 @@ static int max31335_clkout_is_enabled(struct clk_hw *=
hw)
> =C2=A0	unsigned int reg;
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D regmap_read(max31335->regmap, MAX31335_RTC_CONFIG2, &reg);
> +	ret =3D regmap_read(max31335->regmap, max31335->chip->clkout_reg,
> &reg);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> @@ -500,7 +567,7 @@ static int max31335_nvmem_reg_read(void *priv, unsign=
ed
> int offset,
> =C2=A0				=C2=A0=C2=A0 void *val, size_t bytes)
> =C2=A0{
> =C2=A0	struct max31335_data *max31335 =3D priv;
> -	unsigned int reg =3D MAX31335_TS0_SEC_1_128 + offset;
> +	unsigned int reg =3D max31335->chip->ram_reg + offset;
> =C2=A0
> =C2=A0	return regmap_bulk_read(max31335->regmap, reg, val, bytes);
> =C2=A0}
> @@ -509,7 +576,7 @@ static int max31335_nvmem_reg_write(void *priv, unsig=
ned
> int offset,
> =C2=A0				=C2=A0=C2=A0=C2=A0 void *val, size_t bytes)
> =C2=A0{
> =C2=A0	struct max31335_data *max31335 =3D priv;
> -	unsigned int reg =3D MAX31335_TS0_SEC_1_128 + offset;
> +	unsigned int reg =3D max31335->chip->ram_reg + offset;
> =C2=A0
> =C2=A0	return regmap_bulk_write(max31335->regmap, reg, val, bytes);
> =C2=A0}
> @@ -533,7 +600,7 @@ static int max31335_read_temp(struct device *dev, enu=
m
> hwmon_sensor_types type,
> =C2=A0	if (type !=3D hwmon_temp || attr !=3D hwmon_temp_input)
> =C2=A0		return -EOPNOTSUPP;
> =C2=A0
> -	ret =3D regmap_bulk_read(max31335->regmap, MAX31335_TEMP_DATA_MSB,
> +	ret =3D regmap_bulk_read(max31335->regmap, max31335->chip->temp_reg,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg, 2);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> @@ -577,8 +644,8 @@ static int max31335_clkout_register(struct device *de=
v)
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	if (!device_property_present(dev, "#clock-cells"))
> -		return regmap_clear_bits(max31335->regmap,
> MAX31335_RTC_CONFIG2,
> -					 MAX31335_RTC_CONFIG2_ENCLKO);
> +		return regmap_clear_bits(max31335->regmap, max31335->chip-
> >clkout_reg,
> +				=C2=A0 MAX31335_RTC_CONFIG2_ENCLKO);
> =C2=A0
> =C2=A0	max31335->clkout.init =3D &max31335_clk_init;
> =C2=A0
> @@ -605,6 +672,7 @@ static int max31335_probe(struct i2c_client *client)
> =C2=A0#if IS_REACHABLE(HWMON)
> =C2=A0	struct device *hwmon;
> =C2=A0#endif
> +	const struct chip_desc *match;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	max31335 =3D devm_kzalloc(&client->dev, sizeof(*max31335), GFP_KER=
NEL);
> @@ -616,7 +684,11 @@ static int max31335_probe(struct i2c_client *client)
> =C2=A0		return PTR_ERR(max31335->regmap);
> =C2=A0
> =C2=A0	i2c_set_clientdata(client, max31335);
> -
> +	match =3D i2c_get_match_data(client);
> +	if (!match)
> +		return -ENODEV;
> +	max31335->chip =3D match;
> +	max31335->id =3D max31335->chip - chip;

I kind of already expressed this internally... I can't agree with the above=
. Why
not making 'id' a member of 'struct chip_desc'? The above is very useless I=
MHO.

- Nuno S=C3=A1



