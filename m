Return-Path: <linux-rtc+bounces-4706-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BDEB2909B
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Aug 2025 22:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7750CAA83A5
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Aug 2025 20:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C84F230BD5;
	Sat, 16 Aug 2025 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jB6mP0Ru"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5FB1FF1C4;
	Sat, 16 Aug 2025 20:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755377694; cv=none; b=MIalJ0iA0gbzk7OZ8s5jb7ncIlscwbJWFDcEH++xl8Y1QHR14ko1Uka5GwDby3ElnEbvMPU77MkaAZJKamHFTvoGgGT/HRWT+GCIxcPXavji8hdJ+fs2q8PpcWLAslkNp0FRWbqP298KZI+m3sPQgQ685fnErcxalN9CT/+/SSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755377694; c=relaxed/simple;
	bh=OJ2rjoKfqdjV9A6zx3wYUGvdFUVH30eLa7Upq7odQKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXgwZDFHesWZmmE5GjKKjkT+T7VLwGO845Ksodx/3wF3vOb/+ThDgkbti/89WnZNumVDcAtDHXobDfKO/8zbyU6VRDEaH43/ps2ES4XouMK5iCoGDtHbvsMBzq5nDu7fB/xL7CG2JbPIrk8+8lZ40fh/G+Q4zey1d+B8cQg36DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jB6mP0Ru; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7152B442A7;
	Sat, 16 Aug 2025 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755377683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l/CF/Y7iJ0ss1JDPWU4lh6tjzGMoBZNZnXrnJMrKpsI=;
	b=jB6mP0RuVQ4wc3SxnROigpDHTek2uGw5rWBbZImseBiFONapKoKSAo8wlJgiK4nOBZMRKI
	dPn6wzJAzssTkX9fpncQedOJw8Sce4+13PCgjqszRQpj+5rEc7/Yyou/qdJoXXLBKxYW0G
	WmyHEp/odflyZanHExcvoDEmCNozfgofWJHVu5Av+dpbQTvPkqAGGRHKw0xDkeJFOtKpZ7
	9E8A/FrDP+UJ9voCG4EcqL2VX+0Rj0x7o+y0fNmrpRvABB0gdjzfhukNU/JB3BzA4sqm0q
	L5ymJts8bL5CD/QTVBUZaf1nM+d+1jDtjZ0aDOBx4snACx/TKQOlx8Ap6jJptQ==
Date: Sat, 16 Aug 2025 22:53:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Anders Sandahl <anders.sandahl@axis.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@axis.com
Subject: Re: [PATCH] rtc: rx8111: Add NVMEM and timestamp functionality
Message-ID: <2025081620535601a84107@mail.local>
References: <20250429-rtc-rx8111-events-v1-1-7e2a61126042@axis.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-rtc-rx8111-events-v1-1-7e2a61126042@axis.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddvuddugefhfedtgeejteevleeiudetheeluefgiedugfduueekhfffueelieegnecuffhomhgrihhnpegvphhsohhnuggvvhhitggvrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtugemvgegkeejmeduheeivgemfhekiehfmeeiheehtdemudehjedvmeejsgduvdemrggvvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtdgumegvgeekjeemudehiegvmehfkeeifhemieehhedtmeduheejvdemjegsuddvmegrvgdvkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrnhguvghrshdrshgrnhgurghhlhesrgigihhsrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgv
 ghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhesrgigihhsrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

I'm sorry for the delay I was planning to take this during the previous
cycle based on the commit message but after review, the patch does more
than what the commit says.

On 29/04/2025 15:59:21+0200, Anders Sandahl wrote:
> Introduce support for saving a timestamp triggered by an external
> event via the EVIN pin. After an event detection, the timestamp can be
> retrieved from timestamp0 in sysfs.
> 
> Also add a sysfs control timestamp0_write_nvmem to enable the RX8111
> feature that stores timestamps in NVMEM as a circular buffer.
> 
> Signed-off-by: Anders Sandahl <anders.sandahl@axis.com>
> ---
> The Epson RX8111 device has support for saving a time stamp when a 
> hardware trigger occurs. It also has a register area that can be used 
> as non-volatile memory.
> 
> Datasheet: https://download.epsondevice.com/td/pdf/app/RX8111CE_en.pdf
> 
> Timestamp is made available in the same manner as in "rtc-rv3028.c"
> through sys-fs. NVMEM is made available using the framework functions.
> ---
>  drivers/rtc/rtc-rx8111.c | 351 ++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 349 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-rx8111.c b/drivers/rtc/rtc-rx8111.c
> index 8450d9f0b566c63bca04988d892ea4db585ac526..4f428eb98f4858b4c70b3a5709d8204a77d0a1ea 100644
> --- a/drivers/rtc/rtc-rx8111.c
> +++ b/drivers/rtc/rtc-rx8111.c
> @@ -58,7 +58,14 @@
>  #define RX8111_FLAG_XST_BIT BIT(0)
>  #define RX8111_FLAG_VLF_BIT BIT(1)
>  
> +#define RX8111_REG_TS_RAM_START		0x40	/* Timestamp RAM area start. */
> +#define RX8111_REG_TS_RAM_END		0x7f	/* Timestamp RAM area end. */
> +
> +#define RX8111_BIT_EVIN_SETTING_OVW	BIT(1)	/* Enable overwrite timestamp RAM. */
> +#define RX8111_BIT_EVIN_SETTING_PU1	BIT(3)	/* Pull up select 1. */
> +
>  #define RX8111_TIME_BUF_SZ (RX8111_REG_YEAR - RX8111_REG_SEC + 1)
> +#define RX8111_TS_BUF_SZ (RX8111_REG_TS_YEAR - RX8111_REG_TS_SEC + 1)
>  
>  enum rx8111_regfield {
>  	/* RX8111_REG_EXT. */
> @@ -98,6 +105,11 @@ enum rx8111_regfield {
>  	/* RX8111_REG_STATUS_MON. */
>  	RX8111_REGF_VLOW,
>  
> +	/* RX8111_REG_TS_CTRL1. */
> +	RX8111_REGF_TSRAM,
> +	RX8111_REGF_TSCLR,
> +	RX8111_REGF_EISEL,
> +
>  	/* Sentinel value. */
>  	RX8111_REGF_MAX
>  };
> @@ -134,12 +146,16 @@ static const struct reg_field rx8111_regfields[] = {
>  	[RX8111_REGF_CHGEN]  = REG_FIELD(RX8111_REG_PWR_SWITCH_CTRL, 7, 7),
>  
>  	[RX8111_REGF_VLOW]  = REG_FIELD(RX8111_REG_STATUS_MON, 1, 1),
> +
> +	[RX8111_REGF_TSRAM]  = REG_FIELD(RX8111_REG_TS_CTRL1, 0, 0),
> +	[RX8111_REGF_TSCLR]  = REG_FIELD(RX8111_REG_TS_CTRL1, 1, 1),
> +	[RX8111_REGF_EISEL]  = REG_FIELD(RX8111_REG_TS_CTRL1, 2, 2),
>  };
>  
>  static const struct regmap_config rx8111_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> -	.max_register = RX8111_REG_TS_CTRL3,
> +	.max_register = RX8111_REG_TS_RAM_END,
>  };
>  
>  struct rx8111_data {
> @@ -147,8 +163,224 @@ struct rx8111_data {
>  	struct regmap_field *regfields[RX8111_REGF_MAX];
>  	struct device *dev;
>  	struct rtc_device *rtc;
> +	spinlock_t ts_lock;	/* Don't allow poll of ETS bit when it's temporarily disabled. */
>  };
>  
> +static ssize_t timestamp0_store(struct device *dev,
> +				struct device_attribute *attr, const char *buf,
> +				size_t count)
> +{
> +	struct rx8111_data *data = dev_get_drvdata(dev);
> +	int ret, etsval;
> +
> +	/*
> +	 * Clear event only if events are enabled. This is to protect
> +	 * us from losing events in the future if events have been disabled
> +	 * by mistake (error in read function).
> +	 */
> +	spin_lock(&data->ts_lock);
> +	ret = regmap_field_read(data->regfields[RX8111_REGF_ETS], &etsval);
> +	spin_unlock(&data->ts_lock);
> +
> +	if (ret) {
> +		dev_dbg(dev, "Could not read ETS (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	if (!etsval)
> +		return -EINVAL;
> +
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_EVF], 0);
> +	if (ret) {
> +		dev_dbg(dev, "Could not write EVF bit (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_TSCLR], 1);
> +	if (ret) {
> +		dev_dbg(dev, "Could not write TSCLR bit (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t timestamp0_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct rx8111_data *data = dev_get_drvdata(dev);
> +
> +	struct rtc_time tm;
> +	int ret, evfval;
> +	u8 date[RX8111_TS_BUF_SZ];
> +
> +	/* Read out timestamp values only when an event has occurred. */
> +	ret = regmap_field_read(data->regfields[RX8111_REGF_EVF], &evfval);
> +	if (ret) {
> +		dev_dbg(dev, "Could not read EVF (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	if (!evfval)
> +		return 0;
> +
> +	spin_lock(&data->ts_lock);
> +
> +	/* Disable timestamp during readout to avoid unreliable data. */
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 0);
> +	if (ret) {
> +		dev_dbg(dev, "Could not disable timestamp function (%d)\n",
> +			ret);
> +		goto err_out;
> +	}
> +
> +	ret = regmap_bulk_read(data->regmap, RX8111_REG_TS_SEC, date,
> +			       sizeof(date));
> +	if (ret) {
> +		dev_dbg(dev, "Could not read timestamp data (%d)\n", ret);
> +		goto err_out;
> +	}
> +
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 1);
> +	if (ret) {
> +		dev_dbg(dev, "Could not enable timestamp function (%d)\n", ret);
> +		goto err_out;
> +	}
> +
> +	spin_unlock(&data->ts_lock);
> +
> +	tm.tm_sec = bcd2bin(date[0]);
> +	tm.tm_min = bcd2bin(date[1]);
> +	tm.tm_hour = bcd2bin(date[2]);
> +	tm.tm_mday = bcd2bin(date[4]);
> +	tm.tm_mon = bcd2bin(date[5]) - 1;
> +	tm.tm_year = bcd2bin(date[6]) + 100;
> +
> +	ret = rtc_valid_tm(&tm);
> +	if (ret)
> +		return ret;
> +
> +	return sprintf(buf, "%llu\n",
> +		       (unsigned long long)rtc_tm_to_time64(&tm));
> +
> +err_out:
> +	spin_unlock(&data->ts_lock);
> +	return ret;
> +}
> +
> +static DEVICE_ATTR_RW(timestamp0);
> +
> +static ssize_t timestamp0_write_nvmem_store(struct device *dev,
> +					    struct device_attribute *attr,
> +					    const char *buf, size_t count)
> +{
> +	struct rx8111_data *data = dev_get_drvdata(dev);
> +	bool enable;
> +	int ret;
> +
> +	if (count < 1)
> +		return -EINVAL;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_TSRAM],
> +				 enable ? 1 : 0);
> +	if (ret) {
> +		dev_dbg(dev, "Could not set TSRAM bit (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t timestamp0_write_nvmem_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buf)
> +{
> +	struct rx8111_data *data = dev_get_drvdata(dev);
> +	int enable;
> +	int ret;
> +
> +	ret = regmap_field_read(data->regfields[RX8111_REGF_TSRAM], &enable);
> +	if (ret) {
> +		dev_dbg(dev, "Could not read TSRAM bit (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return sprintf(buf, "%s\n", enable ? "1" : "0");
> +}
> +
> +static DEVICE_ATTR_RW(timestamp0_write_nvmem);

Any new ABI has to be documented. Also, sysfs is probably not the
correct interface for this, I've been planning to come up with an
architecture document for a while, I'll try to do so soon after ELCE.

> +
> +static int rx8111_sysfs_register(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = device_create_file(dev, &dev_attr_timestamp0);
> +	if (ret)
> +		return ret;
> +
> +	ret = device_create_file(dev, &dev_attr_timestamp0_write_nvmem);
> +	if (ret)
> +		device_remove_file(dev, &dev_attr_timestamp0);
> +
> +	return ret;
> +}

Please use rtc_add_groups, the probability of one succeeding and the
other one failing is super low.

> +
> +static void rx8111_sysfs_unregister(void *data)
> +{
> +	struct device *dev = (struct device *)data;
> +
> +	device_remove_file(dev, &dev_attr_timestamp0);
> +	device_remove_file(dev, &dev_attr_timestamp0_write_nvmem);
> +}
> +
> +static int rx8111_setup(struct rx8111_data *data)
> +{
> +	int ret;
> +
> +	/* Disable multiple timestamps; area is used for nvmem as default. */
> +	ret = regmap_write(data->regmap, RX8111_REG_TS_CTRL2, 0);
> +	if (ret) {
> +		dev_dbg(data->dev, "Could not setup TS_CTRL2 (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(data->regmap, RX8111_REG_TS_CTRL3, 0);
> +	if (ret) {
> +		dev_dbg(data->dev, "Could not setup TS_CTRL3 (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/* Configure EVIN pin, trigger on low level. PU = 1M Ohm. */
> +	ret = regmap_write(data->regmap, RX8111_REG_EVIN_SETTING,
> +			   RX8111_BIT_EVIN_SETTING_PU1 |
> +				   RX8111_BIT_EVIN_SETTING_OVW);
> +	if (ret) {
> +		dev_dbg(data->dev, "Could not setup EVIN (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/* Enable timestamp triggered by EVIN pin. */
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 1);
> +	if (ret) {
> +		dev_dbg(data->dev, "Could not enable timestamp function (%d)\n",
> +			ret);
> +		return ret;
> +	}
> +

This is where lies the difficulty of getting the interface right. We
can't hardcode any configuration in the driver as this means that we
deviate from the defaults without providing a userspace interface.
However, we need that interface to be generic enough for all RTCs. As
said, I have a draft that I need to refine.

> +	/* Disable all interrupts. */
> +	ret = regmap_write(data->regmap, RX8111_REG_CTRL, 0);
> +	if (ret) {
> +		dev_dbg(data->dev, "Could not disable interrupts (%d)\n", ret);
> +		return ret;
> +	}
> +

This can't be done in probe as this is disabling all alarms in probe.
Alarms have to survive across reboots. It also clears the STOP bit which
must only be done after setting the time.

> +	return 0;
> +}
> +
>  static int rx8111_read_vl_flag(struct rx8111_data *data, unsigned int *vlval)
>  {
>  	int ret;
> @@ -160,6 +392,17 @@ static int rx8111_read_vl_flag(struct rx8111_data *data, unsigned int *vlval)
>  	return ret;
>  }
>  
> +static int rx8111_clear_vl_flag(struct rx8111_data *data)
> +{
> +	int ret;
> +
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_VLF], 0);
> +	if (ret)
> +		dev_dbg(data->dev, "Could not write VL flag (%d)", ret);
> +

This was not in your commit message and this was left out because this
can only be done after setting the time. After reading the datasheet
closer, we should even set all the registers again after this event. Why
would you simply clear the bit?

> +	return ret;
> +}
> +
>  static int rx8111_read_time(struct device *dev, struct rtc_time *tm)
>  {
>  	struct rx8111_data *data = dev_get_drvdata(dev);
> @@ -289,11 +532,69 @@ static int rx8111_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
>  		vlval |= regval ? RTC_VL_BACKUP_LOW : 0;
>  
>  		return put_user(vlval, (typeof(vlval) __user *)arg);
> +	case RTC_VL_CLR:
> +		return rx8111_clear_vl_flag(data);
>  	default:
>  		return -ENOIOCTLCMD;
>  	}
>  }
>  
> +static int rx8111_nvram_write(void *priv, unsigned int offset, void *val,
> +			      size_t bytes)
> +{
> +	struct rx8111_data *data = priv;
> +	int ret, len;
> +
> +	/*
> +	 * The RX8111 device can only handle transfers with repeated start
> +	 * within the same 16 bytes aligned block.
> +	 */
> +	while (bytes > 0) {
> +		len = ((offset % 15) + bytes > 16) ? 16 - (offset % 16) : bytes;
> +		ret = regmap_bulk_write(data->regmap,
> +					RX8111_REG_TS_RAM_START + offset, val,
> +					len);
> +		if (ret) {
> +			dev_dbg(data->dev, "Could not write nvmem (%d)\n", ret);
> +			return ret;
> +		}
> +
> +		val += len;
> +		offset += len;
> +		bytes -= len;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rx8111_nvram_read(void *priv, unsigned int offset, void *val,
> +			     size_t bytes)
> +{
> +	struct rx8111_data *data = priv;
> +	int ret, len;
> +
> +	/*
> +	 * The RX8111 device can only handle transfers with repeated start
> +	 * within the same 16 bytes aligned block.
> +	 */
> +	while (bytes > 0) {
> +		len = ((offset % 15) + bytes > 16) ? 16 - (offset % 16) : bytes;
> +		ret = regmap_bulk_read(data->regmap,
> +				       RX8111_REG_TS_RAM_START + offset, val,
> +				       len);
> +		if (ret) {
> +			dev_dbg(data->dev, "Could not read nvmem (%d)\n", ret);
> +			return ret;
> +		}
> +
> +		val += len;
> +		offset += len;
> +		bytes -= len;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct rtc_class_ops rx8111_rtc_ops = {
>  	.read_time = rx8111_read_time,
>  	.set_time = rx8111_set_time,
> @@ -305,6 +606,16 @@ static int rx8111_probe(struct i2c_client *client)
>  	struct rx8111_data *data;
>  	struct rtc_device *rtc;
>  	size_t i;
> +	int ret;
> +	struct nvmem_config nvmem_cfg = {
> +		.name = "rx8111_nvram",
> +		.word_size = 1,
> +		.stride = 1,
> +		.size = RX8111_REG_TS_RAM_END - RX8111_REG_TS_RAM_START + 1,
> +		.type = NVMEM_TYPE_BATTERY_BACKED,
> +		.reg_read = rx8111_nvram_read,
> +		.reg_write = rx8111_nvram_write,
> +	};
>  
>  	data = devm_kmalloc(&client->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data) {
> @@ -312,6 +623,8 @@ static int rx8111_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  	}
>  
> +	spin_lock_init(&data->ts_lock);
> +
>  	data->dev = &client->dev;
>  	dev_set_drvdata(data->dev, data);
>  
> @@ -331,6 +644,10 @@ static int rx8111_probe(struct i2c_client *client)
>  		}
>  	}
>  
> +	ret = rx8111_setup(data);
> +	if (ret)
> +		return ret;
> +
>  	rtc = devm_rtc_allocate_device(data->dev);
>  	if (IS_ERR(rtc)) {
>  		dev_dbg(data->dev, "Could not allocate rtc device\n");
> @@ -343,7 +660,37 @@ static int rx8111_probe(struct i2c_client *client)
>  
>  	clear_bit(RTC_FEATURE_ALARM, rtc->features);
>  
> -	return devm_rtc_register_device(rtc);
> +	ret = devm_rtc_register_device(rtc);
> +	if (ret) {
> +		dev_dbg(data->dev,
> +			"Could not register rtc device (%d)\n", ret);
> +		return ret;
> +	}

devm_rtc_register_device has to come last, you must not fail after a
successful call.

> +
> +	ret = rx8111_sysfs_register(data->dev);
> +	if (ret) {
> +		dev_dbg(data->dev,
> +			"Could not create sysfs entry (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(data->dev, &rx8111_sysfs_unregister,
> +				       data->dev);
> +	if (ret) {
> +		dev_dbg(data->dev,
> +			"Could not add sysfs unregister devres action (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	nvmem_cfg.priv = data;
> +	ret = devm_rtc_nvmem_register(rtc, &nvmem_cfg);
> +	if (ret) {
> +		dev_dbg(data->dev,
> +			"Could not register rtc nvmem device (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  static const struct of_device_id rx8111_of_match[] = {
> 
> ---
> base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
> change-id: 20250424-rtc-rx8111-events-df9a35810a73
> 
> Best regards,
> -- 
> Anders Sandahl <anders.sandahl@axis.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

