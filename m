Return-Path: <linux-rtc+bounces-6135-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SChnHu97qmkqSQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6135-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 08:02:07 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF25721C3F8
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 08:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5770A30459D7
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2026 07:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722BA372B50;
	Fri,  6 Mar 2026 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E4T4ajbW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8C3371D1C
	for <linux-rtc@vger.kernel.org>; Fri,  6 Mar 2026 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780514; cv=none; b=i1iP0hDCqzPpquGSm/1fzXF+Sn884xJpzY07F4RY12+tRwCtWicZ7R2Fra1soPsHeCis2yteHeos8AvECSyb5wlzhmTLJa+JNnq5FZsLCBOpHmYKdcpBVQeSZ61TTLRj0R4St9bywfXSz/3WduZUm4BvXmR4oV0A+QUVhEKqyfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780514; c=relaxed/simple;
	bh=U5ovtFZGT6J0/COcDYCmDClaijQmWD3Zbr+hgB175wI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mfxcszviyKtUMtN+wEPT1b7azAbxz1swbw4nUhv3lRlquDLNe7hFSeJDYuizDIlC1a+Bz0Hq8xSGTwsKBnDUvTKXhpGyL9FXyq/4XoLpDgcx16y6VrXOG/98QSR38dh7sALvAfFBujhEq1CYWxbdDyXgGfMD2eKvjnP52Qwax6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E4T4ajbW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48371bb515eso131564985e9.1
        for <linux-rtc@vger.kernel.org>; Thu, 05 Mar 2026 23:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772780510; x=1773385310; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g/Izo1I7P2lYa0tqmXpdAdhxEzYAi9jVGmrjmB9VLPo=;
        b=E4T4ajbWUTWlFMArKhQ6V7XMrb5b2K4Skb3GX6ke3CeDTdq3BOs5CkdvPyOwoUoCYi
         gFltKAZML+LKYgacr9grDe7rklDT2EkfpUgMCfs2m68QlzKJSERfTsdq9vVBnGNQNxnD
         Edxm8qvuUpq43O4yKhsLmzu6OwNIW58mIDXibMJAkBb/im6Kf38EimmUo9oCFtBYdx/r
         ELc/gJQUSG0VB5ONcK2psBkqf1zZuTvi9Si01FLfj4E8da1be8XGIKjINLzoDEdSmbtO
         GeS17bHx32jn/ZFqkIbn8zAua8xJIDoC3YtWageqBL1JbvyKxon49CnwpRq+I3ZwRLvZ
         93vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780510; x=1773385310;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/Izo1I7P2lYa0tqmXpdAdhxEzYAi9jVGmrjmB9VLPo=;
        b=maCaybT9us5SYHBQbfGg5x3JLHhKyqNh0jgt/aVsbuxRzs9CFiwZpVSb349PKUL25Y
         5I4OTzJ5xasRGq1JDc0+YscWGb+0dx44xN05S0MlwRkTMSnGtDlKeTqLFyDqXDGt7KC8
         VAYRFlmjhk/OLOGgdy4nKHk/wsA7TN4OHLTglRvaFdAiwALalJXNT/ruFEmc9PG8GXST
         7XvagVvSkhQ4y2O2kRdZeD9xQhBll6pv+QzRABoXQJekFQZLHA6qI/BkhIhIc09uImau
         PB8xpUIubFwTTsW5CKYq5Ka6JZ57exUu10w8GRrnmCun2xvSoI3qTpXQj1pQ7mQbsA7T
         pYNg==
X-Forwarded-Encrypted: i=1; AJvYcCWnjDmFIWZRBVLZoBv3mk8RAZY4YN1+EMQMXpJPHfyogI8m4kdz9t+/Pps8qBFRtAdSzhPh2t6LgNw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnz3i20wn4s7Bj5z8/u40F8M4T1kWCH4jwoesMA+tTQTx7OEAn
	A1B3UAIzQrsBmdDLxjGCciASb/M0rE84/KGhsfGq8ju8kaBND/d0lWCKVqBJHsssoko=
X-Gm-Gg: ATEYQzwXsxzYq+n3Zytx0JuKhblxzgZcgtAAg6ui3Rn6c8MsTwe0ZGQ4PVVdC26S8pz
	y5NUcFmYMZU2el4qyHlkIN1X1y6P9Nzp+c34Y9FF/oz65tdnwpZNSearDw4Zl1IkGX87mSHz1fa
	osd7zePjoKnxc/xZ6HwSMmm0orhiuB1cmjgXs6SzXKMvzgd3P1iN25tazjL14KrG8FKP9wtoLf0
	QmIqapv666F0mavIvu8aUhzOq+CRUBEaZ/K9QAzq2CwmF82D7mmzPSnfrLEufORIclFPXnKIsMb
	mDUdv0841UHeggmXlauKlhSli7ctwxiJQyv4Nih7udn/3PMrhEmiimNxbdfVDBQEoEWpcUdnPl2
	yH6jPvj4d+6xixKQdedxi+QyAkcz/AV2Nnx0WrYnzXzNlFLftFgXbgVd6+/6DJyGsh9ZLr24XSc
	VAJA42GDoeyF4uOEDLqzgbywV52bc2
X-Received: by 2002:a05:6000:2c03:b0:439:bd70:610f with SMTP id ffacd0b85a97d-439da890077mr1657657f8f.44.1772780509950;
        Thu, 05 Mar 2026 23:01:49 -0800 (PST)
Received: from draszik.lan ([212.129.78.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2ba06sm1713784f8f.24.2026.03.05.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:01:49 -0800 (PST)
Message-ID: <198f569078f4a6e3b4e8ad080a94cd336c1e39bf.camel@linaro.org>
Subject: Re: [PATCH v3 07/13] mfd: sec: set DMA coherent mask
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Lee Jones
 <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Corbet	 <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Nam Tran	 <trannamatk@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Fri, 06 Mar 2026 07:03:10 +0000
In-Reply-To: <20260225-s2mu005-pmic-v3-7-b4afee947603@disroot.org>
References: <20260225-s2mu005-pmic-v3-0-b4afee947603@disroot.org>
	 <20260225-s2mu005-pmic-v3-7-b4afee947603@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: CF25721C3F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6135-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[disroot.org,kernel.org,samsung.com,bootlin.com,lwn.net,linuxfoundation.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,disroot.org:email]
X-Rspamd-Action: no action

On Wed, 2026-02-25 at 00:45 +0530, Kaustabh Chakraborty wrote:
> Kernel logs are filled with "DMA mask not set" messages for every
> sub-device. The device does not use DMA for communication, so these
> messages are useless. Disable the coherent DMA mask for the PMIC device,
> which is also propagated to sub-devices.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> =C2=A0drivers/mfd/sec-i2c.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
> index d8609886fcc80..9fa1449a4f6eb 100644
> --- a/drivers/mfd/sec-i2c.c
> +++ b/drivers/mfd/sec-i2c.c
> @@ -177,6 +177,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *clie=
nt)
> =C2=A0		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "regmap init failed\n");
> =C2=A0
> +	client->dev.coherent_dma_mask =3D 0;
> +	client->dev.dma_mask =3D &client->dev.coherent_dma_mask;
> +

This should probably move into sec-common.c as it should apply to all
transports.

Cheers,
A.


