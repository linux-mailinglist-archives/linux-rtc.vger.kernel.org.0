Return-Path: <linux-rtc+bounces-4598-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C32EB130B4
	for <lists+linux-rtc@lfdr.de>; Sun, 27 Jul 2025 18:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81DB4162D76
	for <lists+linux-rtc@lfdr.de>; Sun, 27 Jul 2025 16:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E919C21C192;
	Sun, 27 Jul 2025 16:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="n9P4BBzv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18750BE46;
	Sun, 27 Jul 2025 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753634557; cv=none; b=IdTM/oJWKRXchGdg/u+j+T8TLZTx/vwEp/XgLDpzDGdqmFRoeoch0d3FWg1YzWdZzSBgPEUyv0flmnCpyvn63NeAr+vsu3wBnVw1Wpa3OvejVVVU0dldolZavS9El966JimzpJilILyWhmB5mxU8Ugh9g+O1AqSrD2XA3zo4Hss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753634557; c=relaxed/simple;
	bh=qdTge9b399/etuwByFKQgbjNyHSbmmxUHuU2nelzvZc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=rfSnbdJc8Bz4LqWIzPXw0R9jDgjaeV/ylc+eBr3P1C4si1TpI7J1e47pJCQL8TFawOFg2lHrJyg+J6bI+MYzcuTy04qRbS7DLUutBDKsNAp41RdAOft/XigKbRNQW2pZCHs/XAXrGXfuNOqCk+wJMEW/k5Ff2fXAmH9YIJSEuZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=n9P4BBzv; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1753634551; x=1754239351; i=markus.elfring@web.de;
	bh=eoMmq+a5L6kTjShzYVftXYN21YPdXH7KyRO/3hk7IX8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=n9P4BBzvpirqVILvMNXT9OVMi+kmpnC8DSsDBBneOEbuFVrCYxDndIsqRREDJPcp
	 GDBfI4E8NGz50OAK18n9hitZd1p+Ekvg0rmwHY61KzJPT2xEZ/Mg8srEsdaYsRu11
	 KnZehkLEfRFPIlz7w6xekXmh6widqMqY8fbFD6y5gPIOAQH55rk/H/PhSbIlaXLhx
	 IBvrCJFUvrGFs0vesZV4eSUgRVMj0DGejzPpUREKVKU9JKLYqeUYiqwxLcvjRDTJQ
	 fCrl+tFx9vFzsEdUz3XcGfW3kTaDk5abzTx61/rWyvBTNW0Fvb7Hsl7Y+pfDGGV4j
	 dYgFUTLesd5XiID9Tg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.1]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3m59-1ufnL21ogN-00DCiQ; Sun, 27
 Jul 2025 18:42:31 +0200
Message-ID: <7cbe1a54-176d-43cc-aec9-faadc4a3c72e@web.de>
Date: Sun, 27 Jul 2025 18:42:30 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, Salah Triki <salah.triki@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20250724073308430368ff@mail.local>
Subject: Re: [PATCH] rtc: twl: Check return value of platform_get_irq()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250724073308430368ff@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wXuIHfc9ka9XdiRQp8IqWSVWeWM0355Y75UnoOWaknHRnWLvXd7
 BtNBBPhlPyKBsN+C99WGx2QXB+R9mVDYr3ezy1iPvFP+6jsVDc/CDPga3LSns0hQp7KQ14c
 NlB6mnzz/SsVLrPW+wJT1uPRJXQR01vZNQSJ/3rnlavnkgWoTbhor6954byVkd8hyozpzJp
 PbUQ+DpoQHDqoYcIkSCOw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qBb7hNdBneQ=;0YUF4SkutOEbPyo8yOpK/DShdtF
 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

=E2=80=A6
> > +++ b/drivers/rtc/rtc-twl.c
> > @@ -224,8 +224,11 @@ static int twl_rtc_alarm_irq_enable(struct device=
 *dev, unsigned enabled)
> >  {
> >  	struct platform_device *pdev =3D to_platform_device(dev);
> >  	struct twl_rtc *twl_rtc =3D dev_get_drvdata(dev);
> > -	int irq =3D platform_get_irq(pdev, 0);
> > -	int ret;
> > +	int irq, ret;
> > +
> > +	irq =3D platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
>=20
> It won't ever fail because we know it already succeeded earlier.

An execution failure would be strange at this place after a successful fun=
ction call
within twl_rtc_probe(), wouldn't it?
https://elixir.bootlin.com/linux/v6.16-rc7/source/drivers/rtc/rtc-twl.c#L5=
04-L519

Regards,
Markus

