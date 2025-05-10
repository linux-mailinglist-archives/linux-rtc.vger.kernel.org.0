Return-Path: <linux-rtc+bounces-4084-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9771FAB2427
	for <lists+linux-rtc@lfdr.de>; Sat, 10 May 2025 16:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BF7E7A6484
	for <lists+linux-rtc@lfdr.de>; Sat, 10 May 2025 14:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FBC231855;
	Sat, 10 May 2025 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+c9BwtM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C123B22F776;
	Sat, 10 May 2025 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746887411; cv=none; b=bWgid0HpgcK2UjPMsOJaijyF2PCVV+q99O7tMTOW+iG7yYEY3Z6HKastMTopxL6ots2XdXYIjAi54/H1ouSzPEB4pEkktlr3nhgfZnE9MG/yweh3ppceMBv3GdG6gLZaDv3U0ShbgdhIAJnmsy6z8SuAMSHSxYQC0tCjn1m7t2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746887411; c=relaxed/simple;
	bh=7gKR5UtMn13+zLt0ra7xMJLnlypCI+Xwy7ts2OMRJ1s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gMiLhMHQKk2U8qunkpMXLLrRsKmeLWy7L8aPDyFCJLLLhjtzT1Va5r9wWb7TPUHlqCeV3R8SmnAekVLFFepDnkpIlCUcEt7orNCwOp8ue4Oh788oMETCFALdZ8xbHkUL7xmPLRXSRD9D0HDt1oaMNoMV1s8RFGUhEBLJpmi77Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+c9BwtM; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso5601899a12.3;
        Sat, 10 May 2025 07:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746887408; x=1747492208; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Vcc1sPNAwq2Avldce0tfnp1yheLwV7MWegDuz28tG8=;
        b=R+c9BwtMBdkFFMC8Q5KAtMHh6VzZFNQ2wRSaLY+liZdFjl4rTcM7Ijm5owC60je+9t
         13zQm3uufOcJsDDoU66tp3+cDEuD2BxB/jV3o3BSJB8wquh4eC04/Pzljgv4qY0d0ijN
         5sUKxJm37CmyTG3K7V50wEI78v056r9uYL7Nj+Qx8sjnUEYBnHzlhSA0oQST9d5nsiGf
         sng8wT9MLZXqu8hwtTeolxKu3LuDG3wpf8Ipj35fMoWho2M4wKucMbTWINZvdrh5bWcu
         zMfJUIdBq7C0tl8ERKRbOHb2EAKvYvcV4G7POXbrZYQ0yOLzPjNZ5elxB0nYyTH5JW19
         +vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746887408; x=1747492208;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Vcc1sPNAwq2Avldce0tfnp1yheLwV7MWegDuz28tG8=;
        b=RxdupmrTZ+h8r8zjjDfj7lexGCm0wfX3OKqIEPJsXjM88bsh69Rmc8TFkihDMvsc2S
         2EKIbWFJCCnz/gJUq9/CXc7MXYlF3euPe+Zf4/gpF5YwuG60OlyqgIf70RPcoW1OQNRc
         2c7fVmC2F3ui39yfCz9/fjF0JtRyZWtq01/knJPgrrNGHnfoIg2suWrcJqYqGzwBBNNm
         qaly2jJn1e3tdvxJW9w3Cn7YBQGaDOhQEcJX3Fksr0mV/G+4eNKLLRTy7Mlm3/TqBG7F
         Wx27XTqvFA5QyPxA+zyodGABtlKk+AVupdkEtHGEGjm6n7HGeUshpHqtug2OtrFL6vuC
         tDUA==
X-Forwarded-Encrypted: i=1; AJvYcCWtJW/t2d+82y58W32aUXg2k47Dni6k0AI2vHiyGuML3CGwp3hlcfg5kFEeuzXh6Flhj/IwWs4nUVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvlEIAgSXi9kIqhgaDytrTGjms/H+ADvxeCxo3qfOR6KfRsm6M
	i+V/EKXvSAhuWVzU4fY4hc9dZGOmhjLHdhtq3gv6c3gCq5of6MZQ
X-Gm-Gg: ASbGncvp40j8fnFNVEo2FFQGrpxrZNGk1gYrRkQ7+FnxAdN5tbSfkAljW6Ly3Osy4Oq
	Fu3vqL0LUYyEk5K0xN8LdR1clRgk8Sd+vrXNrWg7DalaOZl4fTOgzLo+N6jdaPFa5jUvJ7BHUt3
	hdwfSjsz83FxrgnSIbz3MGIw4Air9zqkBHbqFlmYSd/wpr4kkc+s+MQAJ+TwJ5MTA/B//2J9Sff
	eGk4loxOkOz0tmk/VnM7xyxkwsO0Ge8aD8a4k792F5Es/iJYZbnIGJ9fXujetj6qeFfIgZWag6l
	35ZGbVS8deylBv/xTnKIakv88KM0NX2M03B5iTZL+L6vnY8FZ8nWqXvKVcKDHv5aomsT3I8=
X-Google-Smtp-Source: AGHT+IHTtS3U/FK4YQq9mimt8v9QXrQcvMdB5tLRdu86v1btaKo4EkPoSzg9Bfnd4d0BdhfJ1xtywA==
X-Received: by 2002:a17:907:8b90:b0:ad2:2fdd:fef2 with SMTP id a640c23a62f3a-ad22fde05c1mr302525266b.53.1746887407671;
        Sat, 10 May 2025 07:30:07 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d70dac9sm2909525a12.67.2025.05.10.07.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 07:30:07 -0700 (PDT)
Message-ID: <4d15d7b363869080da825ddc700e553a68928c85.camel@gmail.com>
Subject: Re: [PATCH v15] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Sat, 10 May 2025 16:30:07 +0200
In-Reply-To: <dm4l3wfcuygmuylz6uqn2g7wztg4tyrjbm24hqcpffjnpkwany@ib2nvjibq2wl>
References: <20250507195626.502240-1-alexander.sverdlin@gmail.com>
	 <dm4l3wfcuygmuylz6uqn2g7wztg4tyrjbm24hqcpffjnpkwany@ib2nvjibq2wl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Inochi!

On Fri, 2025-05-09 at 06:21 +0800, Inochi Amaoto wrote:
> On Wed, May 07, 2025 at 09:56:20PM +0200, Alexander Sverdlin wrote:
> > From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> >=20
> > Implement the RTC driver for CV1800, which able to provide time alarm.
> >=20
> > Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

...

> > +static int cv1800_rtc_probe(struct platform_device *pdev)
> > +{
> > +	struct cv1800_rtc_priv *rtc;
> > +	int ret;
> > +
> > +	rtc =3D devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> > +	if (!rtc)
> > +		return -ENOMEM;
> > +
> > +	rtc->rtc_map =3D device_node_to_regmap(pdev->dev.parent->of_node);
> > +	if (IS_ERR(rtc->rtc_map))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_map),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "cannot get parent regmap\n");
> > +
> > +	rtc->irq =3D platform_get_irq(pdev, 0);
> > +	if (rtc->irq < 0)
> > +		return rtc->irq;
> > +
> > +	rtc->clk =3D devm_clk_get_enabled(pdev->dev.parent, "rtc");
> > +	if (IS_ERR(rtc->clk))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "rtc clk not found\n");
> > +
> > +	platform_set_drvdata(pdev, rtc);
> > +
> > +	device_init_wakeup(&pdev->dev, 1);
> > +
> > +	rtc->rtc_dev =3D devm_rtc_allocate_device(&pdev->dev);
> > +	if (IS_ERR(rtc->rtc_dev))
> > +		return PTR_ERR(rtc->rtc_dev);
> > +
> > +	rtc->rtc_dev->ops =3D &cv1800_rtc_ops;
> > +	rtc->rtc_dev->range_max =3D U32_MAX;
> > +
> > +	ret =3D devm_request_irq(&pdev->dev, rtc->irq, cv1800_rtc_irq_handler=
,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_TRIGGER_HIGH, "rtc alarm"=
, rtc);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "cannot register interrupt handler\n");
> > +
> > +	return devm_rtc_register_device(rtc->rtc_dev);
> > +}
> > +
>=20
> I wonder whether the rtc driver may need reset (maybe optional) for this?
> If so, please add it.

I'm not sure which reset you are referring to... RTC module can carry out
system-wide resets, but cannot be reset itself (as I understand).

Initially I was thinking about providing a reboot driver for Linux utilizin=
g
the RTC module but it turns out PSCI interface is not optional on ARM64, wh=
ich
means PSCI reset interface has to be provided by the firmware (I'm thinking
about U-Boot) and Linux will rely on PSCI reboot.

--=20
Alexander Sverdlin.

