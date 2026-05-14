Return-Path: <linux-rtc+bounces-6497-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEqXJQMwBWr9TAIAu9opvQ
	(envelope-from <linux-rtc+bounces-6497-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2026 04:14:27 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 113FF53CF44
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2026 04:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BB753015A6E
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2026 02:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEC1330B11;
	Thu, 14 May 2026 02:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPE5IdX8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA46625
	for <linux-rtc@vger.kernel.org>; Thu, 14 May 2026 02:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778724864; cv=none; b=uoF8/nhzQr3S8WgBGt1/TuyPK9xaXIVQKGofDEpbt6vbAObW8aPzyhAjoZ0G29PhfROFNkbSa4frMAMv7YibCYjtkPHma7g71RAuI20SGoB1azBNyptQVeRoSTQeQ1XBTo9jLu1Q3fVCGHI2DdLhbTfYnfNLRXkks7QSWkLKJII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778724864; c=relaxed/simple;
	bh=gE2HvHmwzigNwBPoHesD9UdxhZ0Ehim6vcqs+z7Mods=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHZXuD927U6Z17XaZtKrLL7FfohAm3xVGySL+ZBZM4amF86+MYNubfwN7MOlakF2iKFCtNLsl2uc1JDNJXISg8fu7c61IDuC7mNrwym/bjFkubUb/q3wW9yhOqzSM09tjlVvuvTnom2XBmxCi27NauSOhlnpxi7pBqmapTmvlo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPE5IdX8; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f0ad52830cso11008392eec.1
        for <linux-rtc@vger.kernel.org>; Wed, 13 May 2026 19:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778724862; x=1779329662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7Qpmkf3DSLZHVaV2Sltdw1pOYMH7v1LuMy0tCXwCkfs=;
        b=CPE5IdX8dRRSZ4gzki0h+ZMiDi6w4REuS5hSGab8NF4Zc3VtcW//6xi/krYf3zZx7l
         ImnLW2BvQg45e1JsrA2XXHhaOCVctRmSGCAQuHmLF88utnaKBKKuUxl0/5oJTOK//5Tu
         p0JC4y/FBQO8EyfCULkLLZWjqDfeWQvVbMoteLwzL/B/M2tIjl9dSer1fA3D5qbT/+dC
         WXeq2Ykb6LUTiUEIKt4GGz5GKwgRiNkUjfocvW1Y8+3iuD5+SrRJB8z2w7tJPv2AWsdU
         9LHmRSzJYK4VxNT8YPvKPJccvesLd9ZwHr+/2bVuWF13wOUYlpuWre4gICAWvQQcMCpI
         ZvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778724862; x=1779329662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Qpmkf3DSLZHVaV2Sltdw1pOYMH7v1LuMy0tCXwCkfs=;
        b=N6e1lcuJ3URljfTjneS9K4qcUuZVCaTC/TIXLm/VAOUov5u8TIXrN7zvxm0tgRDB+5
         js5P4ryryhF3wv8LqxICJJJ9bLizglYh9NDs+0RAXdpumdZsO0rFd3GralrlXY/g1HGL
         rYEL/5GIAer7Blh0bRf88BWU+1FqMRqi1NIa9xtNH6uzywQK2n7Jbrrt3A1JhRJmrPAR
         YTlMoxLk3WJrE5qY9xs0airqpZsa1pykxAYhPLW1LTwxirC81Qfigfk14+G9VlLeLcnn
         PvO6kCdcb13ZzqVi30kx6Usf8VtKRs2Hw4jSzXMamMu1DLXDa5M5F1BWyNNbvlScfMl9
         sT5w==
X-Forwarded-Encrypted: i=1; AFNElJ9UsCEqt5mo+O5M6H3xb9I8hWG9glcgzXZNDfLd84lGZ8DrvxPhviQCGT/Scfs0rjPpDR8hwblPCxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwrpiXFVTeP5mJhf0/6GfDNefA/m7vccLT4SJ4RdhAwYYFx7oN
	D19Yg6e2eabHL/a/afUFnRXWbW0fNHzliKs9Ju6DznHvnn95+zijvJBV
X-Gm-Gg: Acq92OGPr9AA+l/xfEBRo1L6Tye4wtVA6ytSDbRElJspzdCrwm5/rKbSwK/A+MEDXqM
	iry6tgPuRRFeeLSfCaLojX1vVHF9elDLod5mHZWBLG+MypGhD762AQqfs0i0uQgXZFdWjLK8qv3
	LJqbtJgkulO/1GHhX1tbxJi99mTEiN9xCaSbSg9R39l7nvzjWLLctmBmKyhhBd4pwEFoRJnBiJu
	XKnmBOiRGA+v1WUzwLeQPmC1Uy9jvsZJAr8+RfAAZp5asqW//vQmPZtf+9jb3gmtZvGeteGhwzI
	OrLGJYCMKUK/vIkQ8FyCSQEL9n1CH+XZO7gMxxsFh0HEu2acZd/EBuIPUsz0MrR9hxvX2XiQwYJ
	aFuPgtDAXZ241STyMnqG77L0Rm88SsXjHX8t2zi0URZ0d3l+hFC8oV3YuXduv8LqvVNDgGRvaof
	hemxFr64P3GeOQ/I2A0caOm9fjop3x9eKkNCsPzTH2AReCxmr1yPUfaTKUtd1G09z3yjBnjF2e
X-Received: by 2002:a05:7301:22a8:b0:2d3:2983:c87c with SMTP id 5a478bee46e88-30117c7eb93mr3806778eec.1.1778724861950;
        Wed, 13 May 2026 19:14:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978ad18asm1259151eec.26.2026.05.13.19.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 19:14:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <045f1907-0180-46df-a123-cd0ce349e86b@roeck-us.net>
Date: Wed, 13 May 2026 19:14:20 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] hwmon: (pmbus/adm1266) replace probe-time RTC seed
 with rtc_class device
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>,
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc <linux-rtc@vger.kernel.org>
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
 <20260512-adm1266-v3-4-a81a479b0bb0@nexthop.ai>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260512-adm1266-v3-4-a81a479b0bb0@nexthop.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 113FF53CF44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6497-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nexthop.ai:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,roeck-us.net:mid]
X-Rspamd-Action: no action

On 5/12/26 11:56, Abdurrahman Hussain wrote:
> The driver currently writes the device's internal RTC at probe with
> ktime_get_seconds(), which returns CLOCK_MONOTONIC seconds since boot
> and is not a wall-clock value. The resulting timestamps embedded in
> blackbox records are therefore meaningless across reboots, defeating
> the cross-reboot record-correlation use case the field exists for.
> 
> Switching the seed to ktime_get_real_seconds() does not actually fix
> this: at probe the system wall clock may not yet have been set (no
> external RTC, no userspace NTP), and seeding unconditionally also
> clobbers whatever valid time the ADM1266 retained across a warm
> reboot.
> 
> The data sheet (Rev. D, p. 22) recommends "frequently send the time
> stamp to the ADM1266 to synchronize the UNIX time and reduce the time
> from drifting" when running on the internal oscillator. The clean way
> to expose that policy is an rtc_class device backed by SET_RTC, so
> that userspace tooling (hwclock, chrony, systemd-timesyncd) can drive
> the re-sync against /dev/rtcN once it trusts the system clock - with
> no driver-specific sysfs ABI.
> 
> Drop the probe-time seed and adm1266_set_rtc() entirely. Add an
> rtc_class device whose ->read_time and ->set_time callbacks read and
> write the SET_RTC frame. The rtc_class API is second-precision, so
> the SET_RTC fractional-seconds bytes are always written as zero.
> 

This doesn't just set the RTC time, it also acts as a real-time-clock.
That seems undesirable, since it isn't really a real-time clock.
It would also be the first (pseudo) rtc residing outside the rtc
subsystem.

It seems to me that there must be a better solution. The rtc subsystem
needs to be involved in this discussion.

Note - as sent separately - that making this driver dependent on
the RTC subsystem (as would be required by this patch) is unacceptable.

Guenter

> Fixes: 15609d189302 ("hwmon: (pmbus/adm1266) read blackbox")
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
>   drivers/hwmon/pmbus/adm1266.c | 78 +++++++++++++++++++++++++++++++++++--------
>   1 file changed, 65 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 080e7dbd0c06..05b31bb08f38 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -18,8 +18,8 @@
>   #include <linux/nvmem-consumer.h>
>   #include <linux/nvmem-provider.h>
>   #include "pmbus.h"
> +#include <linux/rtc.h>
>   #include <linux/slab.h>
> -#include <linux/timekeeping.h>
>   
>   #define ADM1266_IC_DEVICE_REV	0xAE
>   #define ADM1266_BLACKBOX_CONFIG	0xD3
> @@ -517,21 +517,73 @@ static int adm1266_config_nvmem(struct adm1266_data *data)
>   	return 0;
>   }
>   
> -static int adm1266_set_rtc(struct adm1266_data *data)
> +/*
> + * SET_RTC frame layout (datasheet Rev. D, Table 84):
> + *   bytes [1:0] = fractional seconds, LSB = 1/65536 s
> + *   bytes [5:2] = seconds since 1970-01-01 UTC
> + * The rtc_class API is second-precision, so the fractional bytes are
> + * always written as zero.
> + */
> +static int adm1266_write_rtc(struct i2c_client *client, time64_t secs)
>   {
> -	time64_t kt;
> -	char write_buf[6];
> +	u8 buf[6] = { 0 };
>   	int i;
>   
> -	kt = ktime_get_seconds();
> +	for (i = 0; i < 4; i++)
> +		buf[2 + i] = (secs >> (i * 8)) & 0xFF;
> +
> +	return i2c_smbus_write_block_data(client, ADM1266_SET_RTC, sizeof(buf), buf);
> +}
> +
> +static int adm1266_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
> +	u32 secs;
> +	int ret;
> +	int i;
>   
> -	memset(write_buf, 0, sizeof(write_buf));
> +	guard(pmbus_lock)(client);
> +	ret = i2c_smbus_read_block_data(client, ADM1266_SET_RTC, buf);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 6)
> +		return -EIO;
>   
> +	secs = 0;
>   	for (i = 0; i < 4; i++)
> -		write_buf[2 + i] = (kt >> (i * 8)) & 0xFF;
> +		secs |= (u32)buf[2 + i] << (i * 8);
> +
> +	rtc_time64_to_tm(secs, tm);
> +	return 0;
> +}
>   
> -	return i2c_smbus_write_block_data(data->client, ADM1266_SET_RTC, sizeof(write_buf),
> -					  write_buf);
> +static int adm1266_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	guard(pmbus_lock)(client);
> +	return adm1266_write_rtc(client, rtc_tm_to_time64(tm));
> +}
> +
> +static const struct rtc_class_ops adm1266_rtc_ops = {
> +	.read_time = adm1266_rtc_read_time,
> +	.set_time = adm1266_rtc_set_time,
> +};
> +
> +static int adm1266_register_rtc(struct adm1266_data *data)
> +{
> +	struct rtc_device *rtc;
> +
> +	rtc = devm_rtc_allocate_device(&data->client->dev);
> +	if (IS_ERR(rtc))
> +		return PTR_ERR(rtc);
> +
> +	rtc->ops = &adm1266_rtc_ops;
> +	rtc->range_min = 0;
> +	rtc->range_max = U32_MAX;
> +
> +	return devm_rtc_register_device(rtc);
>   }
>   
>   static int adm1266_probe(struct i2c_client *client)
> @@ -557,10 +609,6 @@ static int adm1266_probe(struct i2c_client *client)
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = adm1266_set_rtc(data);
> -	if (ret < 0)
> -		return ret;
> -
>   	ret = pmbus_do_probe(client, &data->info);
>   	if (ret)
>   		return ret;
> @@ -569,6 +617,10 @@ static int adm1266_probe(struct i2c_client *client)
>   	if (ret < 0)
>   		return ret;
>   
> +	ret = adm1266_register_rtc(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	adm1266_init_debugfs(data);
>   
>   	return 0;
> 


