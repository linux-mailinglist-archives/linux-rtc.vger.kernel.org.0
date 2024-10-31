Return-Path: <linux-rtc+bounces-2406-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 806019B83A3
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 20:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB3DD1C20A0E
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 19:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8091C1ACB;
	Thu, 31 Oct 2024 19:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="aEiNCdgS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D5A28E8;
	Thu, 31 Oct 2024 19:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730404262; cv=none; b=ZszVgp5jiZ6wWRwXOV0LI87n4+YS7QRKZ/C+VivgRyIlay7vg70OvA4VNLYbLm16zAyw5jK8YQZgB67wDWcRvfck4xsHyujbzFdlDv/6DMAwJXQ+24EhSPA0moCb+++K4kJO+cPPTlYxXqEeguH8DrWJzhrLWOf4sQZJo4c64q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730404262; c=relaxed/simple;
	bh=cv0FscmjkwTSQP726Wzv1f83Fbbipq4xwof3g2hhpTI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=bL/VV/5aO2POk2HIaYUg0b6F/lxdAVdGPtfL/V9tyd+9lEfbaRM1bnQVOgvzm25qFd/SmUhztC3yZPy3nJVq/18NOCsMntQ7ESBU6GT8XumEtu490fW9fmTJ8JTs+izPXoV8IeaL85VVUazrQKCDHrG/+3/OpRN7tncnLiQ3OQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=aEiNCdgS; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1730404240; x=1731009040; i=markus.elfring@web.de;
	bh=X1v04+9ti1vYqVbQdYptxRfNhaWQZMzRG+ZtM3H0vaQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aEiNCdgSPEbrpSWpYozIWAYn8dmD4udFYE2kiJOoL+Fyu32NhSMO87/VJVv335E5
	 IPNqoi740C7y3hDndfjKuq4t1HqEMwlIuStSCYhnqOrklIAdtQ2NWjxv2LyKycI1N
	 +UI7dcQKWnE4/lF+WRXuuifuqUUCiBGKnsr3h0dxiFutMnAMpg6SFXqPe/ix2oN1j
	 AmFfXr025UTrIQ9bJcRTMUVRhD+qu12G68eu2j+P10cs4VQM9h3bSd7OGnGEmw+b6
	 y0+0uks2JbFYbTTy2P8cK+gNcZGGXTZG48YVksi3a/jTPDSOaut/APZ0cKpWYMUvE
	 dstt6K5Z6R1EfY8OoQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MDdy7-1sy6LQ3od5-0075N1; Thu, 31
 Oct 2024 20:50:39 +0100
Message-ID: <976d64da-d6e3-4bd9-af57-d475d9939410@web.de>
Date: Thu, 31 Oct 2024 20:50:36 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
Subject: Re: [PATCH] rtc: mediatek: Add mt6685 RTC driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3XXl7nEu0N/vYBvK/LYU8FhLs2999+6RWvF5+VlfHVprQOcd8U7
 u1MrLMUA+zFDcw431/U5L0xOsphcjpk6OMGIfTfbEm78PzEfs/8oKiaK3Au687A9PL/4oc5
 ytKK28We0pq39sEmBSThDZ85zMh0Gf2SfDdlx8ii6IDkMSstlmBXTRA8Yt522uYJWa9Ps1F
 t/0+bR8LKaBe6BR0U5viw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rfQbZlQQH60=;d02iIenzf35P94pc8brZadhJtjG
 fTcK9wg4yxhU5qgBQmkdpFcZrbQMBxpF/6U2hLILKo/ZmqeoPa0tsZZBmuwSZy0hbolTUU+h7
 +JXfHJDEmUKpYQyCdmnSQiU6YYzS4XK/UVf8Fvs2SYLjckViGsn9lYTVaSiO/6DXTRZBZroZI
 jokJ6xUb06/xNTWnu9IFW1vAi7iARfWvY/8foEaTUxk8QpbZn43L+rPgqwQPyCe8Bm169f35W
 PufN0DxGl+Sfpnq7wSepr2ppmyeoHn+2Y9UX0SPiJR/lb0pUIYQM9ERckV26tACS3hiBtcNCa
 RiHzr2X9eCznE6w+TvNEv2TCv5VZlVKqt6zWTEh6rfKmYGg695Q8jNO3wHBchPdUB2UWxQssk
 hzVlIMZCBkVmxJ0ilYBMwn4jGCWVW4Ywl6XAgLdnLRjn6DlwSxLxsdnmvfTc3KvrZFsoXlcZj
 o5WTHWJ/bBnIu7Ah1xL40O8tNaEgVl97hrsP8dxHQf+QtNDOADSym0ZdyWIfTYyUOd2w0v96z
 +pa4bRRWZ1/qsuDbqWqh+g/XjLjuINJetlyQ4Nz8z0uQlVXWigM7U8uH2ksFViOsqvkTFlt3V
 3D92+g8cA4mllhjku2y2FcddWbMmyB0bVYI8S4mm2utGn10HgIhR4H8JWQxfaIIaULDzMOicv
 VEnVjO63mLkIb/J2A3JLGtS12q+43y2Ci0mIhsVeSQUOc0Aq31CS8bPhNtW3rzr3/Up9O7hIc
 Od395FdXsJYk9BELSllGYxdO06cH1h5UsnK6BHbQZAyeFpuxVgkicqpwj7LUHKYGo3EqM9Vy1
 PKoeNiolPGUy11LUnHh9ddOA==

Please add a change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc5#n45


=E2=80=A6
> +++ b/drivers/rtc/rtc-mt6685.c
> @@ -0,0 +1,1456 @@
=E2=80=A6
> +static void power_on_mclk(struct mt6685_rtc *rtc)
> +{
> +	mutex_lock(&rtc->clk_lock);
=E2=80=A6
> +	mdelay(1);
> +	mutex_unlock(&rtc->clk_lock);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&rtc->clk_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.12-rc5/source/include/linux/mutex.h#L2=
01

Regards,
Markus

