Return-Path: <linux-rtc+bounces-4531-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E04B090C3
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Jul 2025 17:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 115351C414AB
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Jul 2025 15:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A416A2F8C59;
	Thu, 17 Jul 2025 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="VrWJF2+D"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5FD1E572F;
	Thu, 17 Jul 2025 15:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752766943; cv=none; b=FYu+Gx5jikSWnAy1r0M8ga5vrg8zDdTpjU3QJNrj9cgLy9y3iBopEVrdmf1YEzuqStGd49yVbl6QLdTsVFqV8cOfqbj1N5XtE7+RnJmSQpN3vrf4QRlXvUizCZbZbdnOsMDbsqjLkKQdnc0DapC3p1GshBts/f6Kz4Qd9YOlQz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752766943; c=relaxed/simple;
	bh=e+HKdvufzE54L7fhJlx1pz4ayb3HTsSG1E8OM7iUj8g=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=lADGqX89WrTGwhTwxQltpf0o356UzYJ55SSgJ07SaZwtpF22D/JcjOclRG5f6cBJE0I2nSxBoePDoZcz4Z13QNSqmYzMqM6IgjoFuxIte9laXteEuhAPhI/Sx7B5eIRJ0M4czTBMbis97ETQYsNSij4YGu+Sv2HLEg1U4f35KNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=VrWJF2+D; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752766934; x=1753371734; i=markus.elfring@web.de;
	bh=EHO17bPHNYZeJaHsCDjcmPA0O356wAqBFrCjum+Hn48=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VrWJF2+DmKuIa3aOxJ8wWHiMRkn5SDOHHy6gBf7aiLcICAA5FNkbXc3Fr5Q9Rujg
	 UEgzomt7s5HYxkms2sOZ2viZ9jetEOe+7+ysPx5WzE8IGXExnhebc61Mh2TFUYN77
	 HiiTCdtNSnttumdDw07cEP5IAKIX7hIlMAy77WAdBh6graNX50ov7kM/AsCeCb9QP
	 cuVJfjLkSWiKVTkwCOkev2Hqu74QTHcLtYxVjj29I9/dkkW4YnG7WqFElw+7vnytf
	 HoZNWgSaCpjPZjts+5POciopPrsF2GkKmEwk1/tG7yIk1pbcC8n4p/8CrFZKrvozY
	 VBR3LisezWv5FttuDQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.185]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjBVv-1v8Azb0qiT-00noXR; Thu, 17
 Jul 2025 17:42:14 +0200
Message-ID: <045fc0c4-417b-4fd5-8bcf-7c7c34fdb01e@web.de>
Date: Thu, 17 Jul 2025 17:42:12 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Yiting Deng <yiting.deng@amlogic.com>
References: <20250717-rtc-regmap-v1-1-ad19736ccb09@amlogic.com>
Subject: Re: [PATCH] rtc: amlogic-a4: Optimize global variables
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250717-rtc-regmap-v1-1-ad19736ccb09@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BGeuj5jlxc51n1UzIdZLUdRgHBQhZXwqwV2X8C6AmLfF6CMpr8U
 JCZlrNMlbS+uyCzArqzaunSUg/vUycnXZgFothRG3izlx9788xwTf3ZHumYGcUGaKWsafe/
 ZI6df9us14JNYBoNU3TWrBxBeS2xEEcVXJ3PMh9WhWc3kVuuH6W8n/xmvXaAG+Y7EEYvEO2
 PqcqoArBZPFEitvjVU9bA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N2gKsHOTlUo=;uxbi9dx3mK8cKXrASP8KCRrCmYI
 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
 vh65Y=

> Use local variables struct regmap_config instread of global

            variable?                      instead?


> variables. The goal of saving memory has been achieve.

                                                achieved?

You may occasionally put more than 59 characters into text lines
of such a change description.


=E2=80=A6
> ---
> Use local variables struct regmap_config instread of global
> variables.=20
> ---
>  drivers/rtc/rtc-amlogic-a4.c | 14 +++++++-------
=E2=80=A6

Please avoid duplicate information here.


Can a summary phrase like =E2=80=9CConvert a global variable into a local =
one
of aml_rtc_probe()=E2=80=9D be more appropriate?

Regards,
Markus

