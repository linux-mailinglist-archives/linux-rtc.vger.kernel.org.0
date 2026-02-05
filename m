Return-Path: <linux-rtc+bounces-5942-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFxjIsx2hGkX3AMAu9opvQ
	(envelope-from <linux-rtc+bounces-5942-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Feb 2026 11:54:04 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C1BF17ED
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Feb 2026 11:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F77E300373B
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Feb 2026 10:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814F53A9638;
	Thu,  5 Feb 2026 10:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y7wVITrd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEEA3A9628
	for <linux-rtc@vger.kernel.org>; Thu,  5 Feb 2026 10:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288839; cv=none; b=tXVMTVWVvmufmQLvF8tB6C6dSgXRhUyqrtoZomwFAHIDh0R8WvTUbp6sq8PUxNz69fJGQ4ORVwhgYARDt5NEeIlHAsxOb9AB/p5irbKPRJqqCScdSEpMDFGI5T5Up92WfTCoHbaqvfuZR/vRxaEJUF0ASUx0gHcFxwquYs6MI5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288839; c=relaxed/simple;
	bh=dxFq6aqpPeZS/KnlY9gG7jWe91WmosMBfsS9OGUv+zA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OsF2e0yBUXESBnRac5XsuX729v6gvtClaXGFVfX37XQvoMaqFkiGYs1wl8PpH16Zt8703YxDYmDXQ9GFDOSyyFgecsiYMh1TE77UQup0ddVuKBwc/zqOqhoa4GZXm0+WuWJPoyf09EEWiLveBZJqP/e7roa7bUBhMfUJxZjfSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y7wVITrd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee07570deso6734895e9.1
        for <linux-rtc@vger.kernel.org>; Thu, 05 Feb 2026 02:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770288837; x=1770893637; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5MpsejmhVxhP6NeQbHNzOvF3lV3oAS4n7Jzmwih0cw4=;
        b=Y7wVITrd4H2B2VrYNm16a5O9nGvyzthwy9v1r9BUHq9OC7edUAU5W9PmGyeBEsABvk
         EFPcJu2+Ed3JzR3zaFkQniktMvPfwSZ8H5p/9WCv+G+ity1CyJ6sF68T402KDojqSLfY
         sJHm6DsckdO3soPvxoUby+kVKiDrCTnG2YKy2Rk/Hd7hcXCv1K+syLIQESU4GJLZ+oPg
         WDTIbTiaISw4Ha6dAqn7lVixg4V1UqLsHH09CY9GU6cjOOvJ3YgNyPyRxlTOBhfk8Qgi
         yQUl1QIZ92Rypj+Q2euwEiRfVBn0CyIwlcPeMmffpMIkhrPSOaA2U3x/THTXrtWgaugr
         Aiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770288837; x=1770893637;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MpsejmhVxhP6NeQbHNzOvF3lV3oAS4n7Jzmwih0cw4=;
        b=Wg3MIoUE4mf79f9BQiC8ZRWzquJ0PnfsyCGYviUtDkok0eDh4Y2HXKVVzXtiRRz8Rw
         lVniB1kBPKlnu5DcGdpM/f+zfk47vjKX5LlviSAHfubCRAy9alrw/pn4lzb163tGv7Qu
         x4hnhWPv2kPpC2+Xay4nyzCPGCn4Lo4xwNXYplEXCMtt+r1NI3ZT9xAOzr7ZzKBo8EyA
         T9PHJ9nLG868qt8081hzaLstXZPcDIANnSh9Qax23xKys8VBMbbBbS1A1Tb58I1v9rmw
         NeGXj5XDYoPabh0k5Rk26fBYHdLwI3bveFjxIIsWAFA/tfhX1AWN59jex29f88cH9mpr
         jv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUFeyxBX4jzg3H/cfFZcBUkkDMuXk3TrHk+dUUWHfURI0DRKzHeDlxn0b93NWn9TZAVLervWRMoPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJB5u7EJNylx3CGql3OB5c23Czw/xlhfBq5OiGEQC1FS/ou0Zo
	ayQhyIEsUB3WAdUBQzsolBRSWOls51LUvf7StJYsOhe1cracz+sidGtLVkdZMb6j46w=
X-Gm-Gg: AZuq6aIu+YFqnkGvqNN7TlSfxhSFe3dPpvDa1q37Vp8Mtn1kBFR0LCk04nJ6mHyBSYU
	zsV5tuQ3qyPNQCRMs7vCTqwwiZbTsHaN8sMv2wMnrkVtw04lG1/nM9o2rCj0SB8NCJXJu0FKovW
	ycr6xVH3wM7SqzGfbOfBjFuKkz5D9ZQid4V/BW/eJT9WZSbSH2uqUEpd7R4G3qQo7+19LGzyV0p
	n5vjvT7Zqpj+BHsEXuE4yZ2biFD5xiRri349DHmZP5JUG9DPBn8kAzz5uR6/9/HcBcTwfGCsyqe
	xUy026V/hqqNfKhyHi88TlZ89nMDmQn2mc6F3cRM7zAEYIay+VyXGArSxXzUck8RUe2s/4uUj1U
	q0qmZ1kL6nQctxHmdGklAQGpeRWHjmq8VkpLaWtj9i7/EHlX+x9hCagU9vL8sQim5i58IvyzPb1
	UqlSwpLV3a2VX1FlT+1g==
X-Received: by 2002:a05:600c:6290:b0:47e:e20e:bbb7 with SMTP id 5b1f17b1804b1-4830e990a83mr75256515e9.25.1770288837395;
        Thu, 05 Feb 2026 02:53:57 -0800 (PST)
Received: from draszik.lan ([212.129.81.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d4a6b1sm50273325e9.11.2026.02.05.02.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:53:56 -0800 (PST)
Message-ID: <09c1ac114ab108d5f186ee581617a524b9651e96.camel@linaro.org>
Subject: Re: [PATCH v2 08/12] leds: flash: add support for Samsung S2M
 series PMIC flash LED device
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Lee Jones
 <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Corbet	 <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Thu, 05 Feb 2026 10:54:16 +0000
In-Reply-To: <20260126-s2mu005-pmic-v2-8-78f1a75f547a@disroot.org>
References: <20260126-s2mu005-pmic-v2-0-78f1a75f547a@disroot.org>
	 <20260126-s2mu005-pmic-v2-8-78f1a75f547a@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5942-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4C1BF17ED
X-Rspamd-Action: no action

Hi,

On Mon, 2026-01-26 at 00:37 +0530, Kaustabh Chakraborty wrote:

[...]

> diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash/led=
s-s2m-flash.c
> new file mode 100644
> index 0000000000000..1be2745c475bf

[...]

> +
> +static int s2m_fled_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sec_pmic_dev *pmic_drvdata =3D dev_get_drvdata(dev->parent);
> +	struct s2m_fled *priv;
> +	struct fwnode_handle *child;

[...]

> +
> +	device_for_each_child_node(dev, child) {

If you switch to device_for_each_child_node_scoped(), you can get rid
of the goto and the struct fwnode_handle *child declaration at the top,
and you plug your leak in your early error return a few lines below.

> +		u32 reg;
> +
> +		if (fwnode_property_read_u32(child, "reg", &reg))
> +			goto next_child;
> +
> +		if (reg >=3D spec->num_channels) {
> +			dev_warn(dev, "channel %d is non-existent\n", reg);
> +			goto next_child;
> +		}
> +
> +		if (priv[reg].dev) {
> +			dev_warn(dev, "duplicate node for channel %d\n", reg);
> +			goto next_child;
> +		}
> +
> +		priv[reg].dev =3D dev;
> +		priv[reg].regmap =3D regmap;
> +		priv[reg].channel =3D (u8)reg;
> +		priv[reg].spec =3D spec;
> +		priv[reg].pmic_revision =3D pmic_drvdata->revision;
> +
> +		ret =3D devm_mutex_init(dev, &priv[reg].lock);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to create mutex lock\n");
> +
> +		ret =3D s2m_fled_init_channel(dev, child, &priv[reg]);
> +		if (ret < 0)
> +			dev_warn(dev, "channel init failed (%d)\n", ret);
> +
> +next_child:
> +		fwnode_handle_put(child);
> +	}
> +
> +	return 0;
> +}

Cheers,
Andre'

