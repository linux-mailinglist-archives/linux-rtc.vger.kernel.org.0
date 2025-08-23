Return-Path: <linux-rtc+bounces-4743-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC95B326AB
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Aug 2025 05:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5EF23BFA43
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Aug 2025 03:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D7E1E8331;
	Sat, 23 Aug 2025 03:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+JsdPi5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188A62AD22;
	Sat, 23 Aug 2025 03:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755920010; cv=none; b=Ror+i6VJR/EIW1ep75oE5kVbL81O/khAlMr85CK/dzHqepPW/1zb3h00QMpZ3Rw06Tq8vZWPSVhOEYg3LVYJalscLGwm1E/Lw1CZmcBdVdKjysMdKMVrvdATT8z0Fdgfzvi8TOUoi6tJ3kjLNS4BRLEavxpHimEjfi5fsiKrymI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755920010; c=relaxed/simple;
	bh=22aqXHfJ0gDrVnDDeKPXsb5+lMYTML3pkSNh2zWaRXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pxrh8eJwty8Vjp0C8wYSJ97xN7x4KhCX/6rUojS0GPoEMqwO+HPnoTLKB2xREJu8kHdXUkYR43wLqj+oyEsdYikZFiYcpTeJGUxiZ0IWOymMIfIPjtMpevdWKg1nVO8lXP0VvTKUITk4UMBwCtfUFeGE+lWkRXMscaZL9ahGMPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+JsdPi5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2449788923eso20624625ad.2;
        Fri, 22 Aug 2025 20:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755920008; x=1756524808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqumeEmO4Hx86KLVWkSoquZafUAkAj4dwVn2wF9Dw9U=;
        b=l+JsdPi5Rp0C1FL57HAypElcmQst8KbItpmXEGjdcIJ5XBgVj8I8QKXd10eCkJXzKg
         9UAwJftVgUBkZj001CsRBS3RbcatlhMYRfyr1/J19BEitOziykahdCeh7CZtYTLIRMoU
         /DPkgdhRBLDr713rAG4sR6LdNhaz6TwQAlQkS3za7mFldixeI1DMqNdE2wPiyxKDhTj/
         AGjCVV13oBHeaijONjtcDxYDRiqmryR4BcGnhcvwqZwXurrWZhZplqqKCMTB6Q99Fx/U
         k3ADMvr4vtAlbi1wmydJKihl/lTjYZKs34lAmlwr6sq2aP9va7qK+niA21PXgmmKIMS7
         7Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755920008; x=1756524808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqumeEmO4Hx86KLVWkSoquZafUAkAj4dwVn2wF9Dw9U=;
        b=SFbxcLcfCfkTtGbUE35WTN7F5MHMHUED/d+Ndbd/7FN8wBPaZk3vx3Odbaq/xElW8K
         8knM3lFYfLcH6kgoZwzEIJeqV3K0AruAMDOdn1mTlRvnjEKqm/UsTtXug44e4kLK2LrT
         ygQ6SWiwCIBQJUqHVzOkD5ZCVpZ7bM7GVDLe9DqK99EAPT7C6rIyfygz4WtfG9Cv/yot
         stpVx3RAq1PnF1Fr5gZQT2fvvCf7j5UtO41vssqm6PvAEmTsQqH+ds1MUxetPcO/Px4k
         HX8ymrFu5mBu/a2c3GlBHfen7S6nWrnR/8E7wlnRNeGcPnk+39dHiJh+CjwH3eTsAN+W
         ywmA==
X-Forwarded-Encrypted: i=1; AJvYcCURsvayfvAzP8YtPzytWGP9Ieggatu7+EcQDupuDZWJhBGxBhPFzWufO56v/oDI/66ESTm93OSFFNS5lCo=@vger.kernel.org, AJvYcCUeTzz8F4GdMH79LYpiIS6DE15+7dCa6160ZlrLgVaE7QK/GxOsBWyWgXkehzzKNVAygtG/uVwGPBWf@vger.kernel.org, AJvYcCX3RrOG4niMcd8xwOeaWGaDPNdnOLd7o8VF2+hb6+eNrNsPwxev+rk4JTzpjXaH/JSdQ8yf7KKbhwxSKjA=@vger.kernel.org, AJvYcCX7huaFwNkacbJwgQVn7dcLICc+4lJk8l4IN4qbSD0WIJtetq0HTD8HLLBH85rqkz0xbm2arp7Ud/4MEzeT@vger.kernel.org, AJvYcCXcxKwCY8Cr/NZuBEFpMhIroT1PH/idZRblNDI7y/R1ps6wVXu+KvZ7L7wPTmv4wWIcZabsMqpAQCnk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2wPXpu33eRQzk338e3QCroWbsopKFAmzoEQhTKY6AhLwSptpT
	kST147h5ERd9Nfep1ZPK7Uz8aX+ysIoLhP01dwz9hqKCcWwn01F7DwIr
X-Gm-Gg: ASbGncuU5FO5DlHqrAwmYdgynXB4LxbiU7stT5gqDoYHxQFYVS5Os0g6ZrNoijtV5hG
	5kX6ipFxr0WrRndmkgq2w8OMDSpQkFGLc7V3dybl7Zm0iivHk8OqV3Sa2iJyi89WoMcRjcVdtZj
	7hPDCYvZSD471HDeJbpsyrWpxJNR8stNurOP+R2Y2C/P+U6xrKGRQtSfCMxYQgkdhy2zZn/fxcQ
	HBHNsPEV1vyux2Sv3fxAgop04hfMlOCst+PgQHfEhTyfHxA25bolWyXJXKm4s2BScmSlppXjm+3
	3qQgtf+ottHO0SVFiUmWuhUdc8o2AAa+VN7zocj3ZAg4gStQkn4tabp6RFHtRJrERO3nNAeC9Qa
	5BoOoyWs06sFp8Lm2nhHeCHHSZNEWzgSJ4mD41vQ0Oubs01PamjEDkkQGwOP4LPofNuqJ9fjwgI
	Mvh2i8/w9fWeBLE4j0DyOf
X-Google-Smtp-Source: AGHT+IFNO6qfKHbLRi+OpQWp6841qH14Emm/wJaX729M23KqjGDOidxlZhEBKjGLIE2PeRR5ofMyBw==
X-Received: by 2002:a17:903:320d:b0:242:a3fc:5917 with SMTP id d9443c01a7336-2462ede290dmr67089965ad.2.1755920008250;
        Fri, 22 Aug 2025 20:33:28 -0700 (PDT)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466887fc80sm10166575ad.124.2025.08.22.20.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 20:33:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org
Subject: Re: [PATCH 4/8] hwmon: Add Apple Silicon SMC hwmon driver
Date: Sat, 23 Aug 2025 13:33:20 +1000
Message-ID: <5792171.kQq0lBPeGt@setsuna>
In-Reply-To: <56e1f496-a4c7-46a5-bd74-0412c1fd7207@roeck-us.net>
References:
 <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-4-57df6c3e5f19@gmail.com>
 <56e1f496-a4c7-46a5-bd74-0412c1fd7207@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Guenter,

On Wednesday, 20 August 2025 2:02:58=E2=80=AFam Australian Eastern Standard=
 Time Guenter Roeck wrote:
> On 8/19/25 04:47, James Calligeros wrote:
> > +/*
> > + * Many sensors report their data as IEEE-754 floats. No other SMC
> > function uses + * them.
> > + */
> > +static int macsmc_hwmon_read_f32_scaled(struct apple_smc *smc, smc_key
> > key, +					int *p, int scale)
> > +{
> > +	u32 fval;
> > +	u64 val;
> > +	int ret, exp;
> > +
> > +	ret =3D apple_smc_read_u32(smc, key, &fval);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	val =3D ((u64)((fval & FLT_MANT_MASK) | BIT(23)));
> > +	exp =3D ((fval >> 23) & 0xff) - FLT_EXP_BIAS - FLT_MANT_BIAS;
> > +	if (scale < 0) {
> > +		val <<=3D 32;
> > +		exp -=3D 32;
> > +		val /=3D -scale;
>=20
> I am quiter sure that this doesn't compile on 32 bit builds.
>=20
I don't see why not. We're not doing any 64-bit math on pointers, so we sho=
uld
be safe here. Regardless, this driver depends on MFD_MACSMC, which depends =
on
ARCH_APPLE, which is an ARM64 platform, so this driver shouldn't be compiled
during a 32-bit build anyway.


> > +
> > +	ret =3D of_property_read_string(fan_node, "apple,key-id", &now);
> > +	if (ret) {
> > +		dev_err(dev, "apple,key-id not found in fan node!");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret =3D macsmc_hwmon_parse_key(dev, smc, &fan->now, now);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!of_property_read_string(fan_node, "label", &label))
> > +		strscpy_pad(fan->label, label, sizeof(fan->label));
> > +	else
> > +		strscpy_pad(fan->label, now, sizeof(fan->label));
> > +
> > +	fan->attrs =3D HWMON_F_LABEL | HWMON_F_INPUT;
> > +
> > +	ret =3D of_property_read_string(fan_node, "apple,fan-minimum", &min);
> > +	if (ret)
> > +		dev_warn(dev, "No minimum fan speed key for %s", fan->label);
> > +	else {
> > +		if (!macsmc_hwmon_parse_key(dev, smc, &fan->min, min))
> > +			fan->attrs |=3D HWMON_F_MIN;
>=20
> Above the error from macsmc_hwmon_parse_key() results in an abort,
> here the error is logged in the function and ignored.
>=20
> Either it is an error or it isn't. Ignoring errors is not acceptable.
> Dumping error messages and ignoring the error is even less acceptable.
>=20
The only strictly required key for fan speed monitoring is apple,key-id,
which is why it is the only one that causes an early return when parsing
it fails. If we don't have keys in the DT for min, max, target and mode,
then all that means is we can't enable manual fan speed control. I don't
see how making a failure to read these keys non-blocking is unacceptable
in this context. If this is about the dev_err print in parse_key, then
I can just get rid of that and have the parse_key callers do it when it's
actually a blocking error.

Regards,
James







