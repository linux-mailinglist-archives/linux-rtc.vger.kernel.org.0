Return-Path: <linux-rtc+bounces-3039-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D37F1A1B667
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 13:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB449188B7C1
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 12:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FD3F9CB;
	Fri, 24 Jan 2025 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="sAWWDQqa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A0B4C6C
	for <linux-rtc@vger.kernel.org>; Fri, 24 Jan 2025 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723427; cv=none; b=JwKvn3pZlpFGWmXN5V/rcBCeJ6fy86NMw0lbhDTs0/iNpWpft/jeEmaUDUh76aJPQ1cCjPSsshu0SyB1dORiLTMkmvzSUProWPXN3zFzdCUVtIndFJjalE8DyKMS/h6LUoSpjTu253tBZjDkTynAx/5HsREqOZL21tfzoijKMBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723427; c=relaxed/simple;
	bh=4V+4vpsG4A21tuMIVP9AGHfxXtE2sMXUJPnnthrx07c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyAwhowFdOiB+TSES0HzE6ExRPpNggwXwiwL2f/LAeOuXSS8pxjn1TgDbdgTk3JDDnU9U6diJl1uMHs8guzikbK8lN0RjYXBfeuB0B5JaDwKagYULXGSrQdkvWr4dDRQCTJYtgyJBMVaEvPmtz39yyr8BdsVcuAY6TgPX9qxrdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=sAWWDQqa; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F28623F29E
	for <linux-rtc@vger.kernel.org>; Fri, 24 Jan 2025 12:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1737723421;
	bh=J6/gN7Pd3B+HSO/sALygzOa6m+gQWzhldSmINAgQzjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=sAWWDQqatzLczN1lzxgvNrB6y4jaaskvtPZtrgfgz0PhPcD9R8tqhw4YrJzRSrTuR
	 C8+bxWwzpLva8LfjO3W3kdIrDmqWEbi59JdgnQUK75jMEm4NmaY89pZ7o6yGZpqTXe
	 0I5XOKNgh7J2CYf7Uje+bae5XKdod3GYt6YZFX1r4Y21Lia/WjCmjcva8hV4lXWc2R
	 a2Dtlgn7Gtf0NzcjOq6ZlJbZX9gPJMhaZ4MXk6X3UwNW2OZ+hPtV3MdvwTYb5UGTpX
	 0antnPlXwzS3sIew1BtGWncRqOIGzGpzWWNwlO4FypHEiH5W+iGlC6JtGI6F/MLTNb
	 0gJMtEJRjZhcQ==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d3ff3c1b34so2906996a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 24 Jan 2025 04:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723420; x=1738328220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6/gN7Pd3B+HSO/sALygzOa6m+gQWzhldSmINAgQzjw=;
        b=lXA2jz6wk2dUSJEEy8FXzI+2AYr6szbapfLZG41VCe8CYmQukOrFo8qhNEvhkhapc0
         YYGU+5hdJL8YPCUX/WAGlC1sjk34dJOwkU8q+D4toRp/4Jt3D2faAKq+HVuwglzj0hJs
         Sjn2BMyHgS2hVTQJ21fcizyfq2fTGxX781t9oDTrgLTkrpW6ydrcoh1jZCZqC5kwLO+u
         MwzqqfKlLyGFs2m1cVLWvmK8WpSOfkca5P5B1wTKnjqaFRW7MIhJ4gcTtEr6tMIErT6D
         lmU6F3GFvP61XBYfa1GAnsD22UI18B1kj0tRUfeU8iwUE+5Eu4Tiic7IArj7cZ1zByGW
         44+w==
X-Forwarded-Encrypted: i=1; AJvYcCXr9T5zWQHh+JtyN4L6FJLJ24KkPpF6yfYjyNzBpLIeh9A9xckl/QYsjnGmQX6sGLLVH0+qPedS2dE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTrSCeA1G2mEjZ8Xgseswx+sWw0K5FKyE1GQP+oT3Hce0Y82hE
	6kncgaGhPEt7w99Cyk7GI9w6vPgDCAF4CNTfP+s9UHCXQVYPpinbnOHIpNzh1y694lavcA9fuDC
	Kllpna7NWDyrfUG/eFp2FDvNZecjddzljDRP6JJofvMJePPecPK79zLjrh+UggPUG1KEa3ANdgQ
	==
X-Gm-Gg: ASbGncssuSM2ca+SpbQnvC5USYqLScDlflQ4tqxYtGnJfnTgNo81F59rQ25zIBGma+I
	E8jMJMjFE4HkWAq/t12m8Y1H4si9O4tq3QYKBpzCGAPfNAtguGWy8VVoDkts/PBpEVx4NWRddbh
	dWpz49J9rbtDU/i1ysLkqrQFripayOuiUaUBwQYMp4pR2kLHBGufrrfGoKqfYkrWnf+yKZz/PzI
	VJnEwJc/9CehTA4u9FhKnhH12ycyG/imlD4P1YZWQHVb35hCJaGrMdaCKHLkL0qpmT+vRG5pJAf
	lINq9Hdn
X-Received: by 2002:a05:6402:27d1:b0:5d2:be16:de1f with SMTP id 4fb4d7f45d1cf-5db7d354c56mr26760042a12.23.1737723420300;
        Fri, 24 Jan 2025 04:57:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxwoMC4E5bFgk0lVOvdnU3m/sztvq/wJDtKlmQGlFNNL41i/29KpepdAqRvgtNwKN23aPB9w==
X-Received: by 2002:a05:6402:27d1:b0:5d2:be16:de1f with SMTP id 4fb4d7f45d1cf-5db7d354c56mr26760022a12.23.1737723419855;
        Fri, 24 Jan 2025 04:56:59 -0800 (PST)
Received: from shodan.l0w.de ([2001:a61:340a:c401:c512:e163:34d2:a30e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc1863a87fsm1164314a12.38.2025.01.24.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 04:56:59 -0800 (PST)
Date: Fri, 24 Jan 2025 13:56:56 +0100
From: Tobias Heider <tobias.heider@canonical.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] rtc: pm8xxx: add support for uefi offset
Message-ID: <wkkhlpgqf7vdtsmxqdt6izysj7nmbemmzf3lkclbg5oewn3xz5@oybsmken7s4h>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-4-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120144152.11949-4-johan+linaro@kernel.org>

On Mon, Jan 20, 2025 at 03:41:48PM GMT, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which the
> driver can take into account.
> 
> Add support for storing a 32-bit offset from the GPS time epoch in a
> UEFI variable so that the RTC time can be set on such platforms.
> 
> The UEFI variable is
> 
>             882f8c2b-9646-435f-8de5-f208ff80c1bd-RTCInfo
> 
> and holds a 12-byte structure where the first four bytes is a GPS time
> offset in little-endian byte order.
> 
> Note that this format is not arbitrary as the variable is shared with
> the UEFI firmware (and Windows).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Thanks for the great work Johan, seems to work nicely here!

I think you might need to add MODULE_IMPORT_NS(EFIVAR) for the efivar_*
API calls you added.

> ---
>  drivers/rtc/rtc-pm8xxx.c | 125 +++++++++++++++++++++++++++++++++++++--
>  include/linux/rtc.h      |   1 +
>  2 files changed, 121 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index 2f32187ecc8d..be1983bf35cd 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2010-2011, Code Aurora Forum. All rights reserved.
>   * Copyright (c) 2023, Linaro Limited
>   */
> +#include <linux/efi.h>
>  #include <linux/of.h>
>  #include <linux/module.h>
>  #include <linux/nvmem-consumer.h>
> @@ -16,9 +17,10 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> -
>  #include <linux/unaligned.h>
>  
> +#include <asm/byteorder.h>
> +
>  /* RTC_CTRL register bit fields */
>  #define PM8xxx_RTC_ENABLE		BIT(7)
>  #define PM8xxx_RTC_ALARM_CLEAR		BIT(0)
> @@ -46,14 +48,21 @@ struct pm8xxx_rtc_regs {
>  	unsigned int alarm_en;
>  };
>  
> +struct qcom_uefi_rtc_info {
> +	__le32	offset_gps;
> +	u8	reserved[8];
> +} __packed;
> +
>  /**
>   * struct pm8xxx_rtc -  RTC driver internal structure
>   * @rtc:		RTC device
>   * @regmap:		regmap used to access registers
>   * @allow_set_time:	whether the time can be set
> + * @use_uefi:		use UEFI variable as fallback for offset
>   * @alarm_irq:		alarm irq number
>   * @regs:		register description
>   * @dev:		device structure
> + * @rtc_info:		qcom uefi rtc-info structure
>   * @nvmem_cell:		nvmem cell for offset
>   * @offset:		offset from epoch in seconds
>   */
> @@ -61,13 +70,101 @@ struct pm8xxx_rtc {
>  	struct rtc_device *rtc;
>  	struct regmap *regmap;
>  	bool allow_set_time;
> +	bool use_uefi;
>  	int alarm_irq;
>  	const struct pm8xxx_rtc_regs *regs;
>  	struct device *dev;
> +	struct qcom_uefi_rtc_info rtc_info;
>  	struct nvmem_cell *nvmem_cell;
>  	u32 offset;
>  };
>  
> +#ifdef CONFIG_EFI
> +
> +MODULE_IMPORT_NS("EFIVAR");
> +
> +#define QCOM_UEFI_NAME	L"RTCInfo"
> +#define QCOM_UEFI_GUID	EFI_GUID(0x882f8c2b, 0x9646, 0x435f, \
> +				 0x8d, 0xe5, 0xf2, 0x08, 0xff, 0x80, 0xc1, 0xbd)
> +#define QCOM_UEFI_ATTRS	(EFI_VARIABLE_NON_VOLATILE | \
> +			 EFI_VARIABLE_BOOTSERVICE_ACCESS | \
> +			 EFI_VARIABLE_RUNTIME_ACCESS)
> +
> +static int pm8xxx_rtc_read_uefi_offset(struct pm8xxx_rtc *rtc_dd)
> +{
> +	struct qcom_uefi_rtc_info *rtc_info = &rtc_dd->rtc_info;
> +	unsigned long size = sizeof(*rtc_info);
> +	struct device *dev = rtc_dd->dev;
> +	efi_status_t status;
> +	u32 offset_gps;
> +	int rc;
> +
> +	rc = efivar_lock();
> +	if (rc)
> +		return rc;
> +
> +	status = efivar_get_variable(QCOM_UEFI_NAME, &QCOM_UEFI_GUID, NULL,
> +				     &size, rtc_info);
> +	efivar_unlock();
> +
> +	if (status != EFI_SUCCESS) {
> +		dev_dbg(dev, "failed to read UEFI offset: %lu\n", status);
> +		return efi_status_to_err(status);
> +	}
> +
> +	if (size != sizeof(*rtc_info)) {
> +		dev_dbg(dev, "unexpected UEFI structure size %lu\n", size);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "uefi_rtc_info = %*ph\n", (int)size, rtc_info);
> +
> +	/* Convert from GPS to Unix time offset */
> +	offset_gps = le32_to_cpu(rtc_info->offset_gps);
> +	rtc_dd->offset = offset_gps + (u32)RTC_TIMESTAMP_EPOCH_GPS;
> +
> +	return 0;
> +}
> +
> +static int pm8xxx_rtc_write_uefi_offset(struct pm8xxx_rtc *rtc_dd, u32 offset)
> +{
> +	struct qcom_uefi_rtc_info *rtc_info = &rtc_dd->rtc_info;
> +	unsigned long size = sizeof(*rtc_info);
> +	struct device *dev = rtc_dd->dev;
> +	efi_status_t status;
> +	u32 offset_gps;
> +
> +	/* Convert from Unix to GPS time offset */
> +	offset_gps = offset - (u32)RTC_TIMESTAMP_EPOCH_GPS;
> +
> +	rtc_info->offset_gps = cpu_to_le32(offset_gps);
> +
> +	dev_dbg(dev, "efi_rtc_info = %*ph\n", (int)size, rtc_info);
> +
> +	status = efivar_set_variable(QCOM_UEFI_NAME, &QCOM_UEFI_GUID,
> +				     QCOM_UEFI_ATTRS, size, rtc_info);
> +	if (status != EFI_SUCCESS) {
> +		dev_dbg(dev, "failed to write UEFI offset: %lx\n", status);
> +		return efi_status_to_err(status);
> +	}
> +
> +	return 0;
> +}
> +
> +#else	/* CONFIG_EFI */
> +
> +static int pm8xxx_rtc_read_uefi_offset(struct pm8xxx_rtc *rtc_dd)
> +{
> +	return -ENODEV;
> +}
> +
> +static int pm8xxx_rtc_write_uefi_offset(struct pm8xxx_rtc *rtc_dd, u32 offset)
> +{
> +	return -ENODEV;
> +}
> +
> +#endif	/* CONFIG_EFI */
> +
>  static int pm8xxx_rtc_read_nvmem_offset(struct pm8xxx_rtc *rtc_dd)
>  {
>  	size_t len;
> @@ -112,10 +209,13 @@ static int pm8xxx_rtc_write_nvmem_offset(struct pm8xxx_rtc *rtc_dd, u32 offset)
>  
>  static int pm8xxx_rtc_read_offset(struct pm8xxx_rtc *rtc_dd)
>  {
> -	if (!rtc_dd->nvmem_cell)
> +	if (!rtc_dd->nvmem_cell && !rtc_dd->use_uefi)
>  		return 0;
>  
> -	return pm8xxx_rtc_read_nvmem_offset(rtc_dd);
> +	if (rtc_dd->nvmem_cell)
> +		return pm8xxx_rtc_read_nvmem_offset(rtc_dd);
> +	else
> +		return pm8xxx_rtc_read_uefi_offset(rtc_dd);
>  }
>  
>  static int pm8xxx_rtc_read_raw(struct pm8xxx_rtc *rtc_dd, u32 *secs)
> @@ -155,7 +255,7 @@ static int pm8xxx_rtc_update_offset(struct pm8xxx_rtc *rtc_dd, u32 secs)
>  	u32 offset;
>  	int rc;
>  
> -	if (!rtc_dd->nvmem_cell)
> +	if (!rtc_dd->nvmem_cell && !rtc_dd->use_uefi)
>  		return -ENODEV;
>  
>  	rc = pm8xxx_rtc_read_raw(rtc_dd, &raw_secs);
> @@ -167,7 +267,11 @@ static int pm8xxx_rtc_update_offset(struct pm8xxx_rtc *rtc_dd, u32 secs)
>  	if (offset == rtc_dd->offset)
>  		return 0;
>  
> -	rc = pm8xxx_rtc_write_nvmem_offset(rtc_dd, offset);
> +	if (rtc_dd->nvmem_cell)
> +		rc = pm8xxx_rtc_write_nvmem_offset(rtc_dd, offset);
> +	else
> +		rc = pm8xxx_rtc_write_uefi_offset(rtc_dd, offset);
> +
>  	if (rc)
>  		return rc;
>  
> @@ -486,6 +590,17 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>  		if (rc != -ENOENT)
>  			return rc;
>  		rtc_dd->nvmem_cell = NULL;
> +
> +		/* Use UEFI storage as fallback if available */
> +		rtc_dd->use_uefi = of_property_read_bool(pdev->dev.of_node,
> +							 "qcom,uefi-rtc-info");
> +	}
> +
> +	if (rtc_dd->use_uefi && !efivar_is_available()) {
> +		if (IS_ENABLED(CONFIG_EFI))
> +			return -EPROBE_DEFER;
> +		dev_warn(&pdev->dev, "efivars not available\n");
> +		rtc_dd->use_uefi = false;
>  	}
>  
>  	rtc_dd->regs = match->data;
> diff --git a/include/linux/rtc.h b/include/linux/rtc.h
> index 3f4d315aaec9..95da051fb155 100644
> --- a/include/linux/rtc.h
> +++ b/include/linux/rtc.h
> @@ -170,6 +170,7 @@ struct rtc_device {
>  /* useful timestamps */
>  #define RTC_TIMESTAMP_BEGIN_0000	-62167219200ULL /* 0000-01-01 00:00:00 */
>  #define RTC_TIMESTAMP_BEGIN_1900	-2208988800LL /* 1900-01-01 00:00:00 */
> +#define RTC_TIMESTAMP_EPOCH_GPS		315964800LL /* 1980-01-06 00:00:00 */
>  #define RTC_TIMESTAMP_BEGIN_2000	946684800LL /* 2000-01-01 00:00:00 */
>  #define RTC_TIMESTAMP_END_2063		2966371199LL /* 2063-12-31 23:59:59 */
>  #define RTC_TIMESTAMP_END_2079		3471292799LL /* 2079-12-31 23:59:59 */
> -- 
> 2.45.2
> 
> 

