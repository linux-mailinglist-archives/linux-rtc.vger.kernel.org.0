Return-Path: <linux-rtc+bounces-4873-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16847B53CBF
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 21:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 577A71CC4C83
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 19:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B05F25F7A5;
	Thu, 11 Sep 2025 19:55:15 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E916924A04A;
	Thu, 11 Sep 2025 19:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757620515; cv=none; b=AVgUxObabaUdCQTdAsIch1Gw2jD+M04igGyTXH4oGzYqiRsIJRBb384oWonZS66xMnB+nVEp+AiHNvHzTcicYesRjzoASFPHglaXdw4tfLee56F3CVXrzaHKfW9LQkOh15QL1WCgGzVt7aY7bSZtwD+MoPDFapL0sncrNItsUpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757620515; c=relaxed/simple;
	bh=Xobcx+JBTN1wOClC166lyLtzG+jp5ZjUpFZ7pPrajjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epeeXu/TtfI+UoUpDYS0KPbGmFJTDzzynWtFOc1NLtbEkn8hhHxAhKArGGogegznVYHFwgCZyyPjHZnEMt5WEfTS+mdx0ANHmfgIlfUBaFLdimonkfcsGyD9ANUxdBYV1nl4hit2lMa724JGFM3dQIePWpVUchmnUWHWlPnK854=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 05E0C335DB4;
	Thu, 11 Sep 2025 19:55:10 +0000 (UTC)
Date: Fri, 12 Sep 2025 03:55:02 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, lgirdwood@gmail.com, broonie@kernel.org,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-ID: <20250911195502-GYA1223946@gentoo.org>
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
 <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>

Hi Alex,

On 11:36 Thu 11 Sep     , Alex Elder wrote:
> On 9/3/25 7:19 AM, Lee Jones wrote:
> > On Mon, 25 Aug 2025 12:20:49 -0500, Alex Elder wrote:
> >> The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
> >> converters and 12 LDOs.  It contains a load switch, ADC channels,
> >> GPIOs, a real-time clock, and a watchdog timer.
> >>
> >> This series introduces a multifunction driver for the P1 PMIC as
> >> well as drivers for its regulators and RTC.
> >>
> >> [...]
> > 
> > Applied, thanks!
> > 
> > [1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
> >        commit: baac6755d3e8ddf47eee2be3ca72fe14ebae2143
> > [2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
> >        commit: 49833495c85f26d070e70148fd9607c6fbf927fd
> > 
> > --
> > Lee Jones [李琼斯]
> > 
> 
> Yixun Lan plans to merge patches 5-7 of this series.
> 
DT patches usually go as the last one, in this case, they effectively
depened on patch 3 which adds the regulator support

As Mark suggest it go via MFD, that leaves Jones to handle,
It's close to the release of rc6, I'd hope it isn't too late..

> That leaves patch 3, which enables regulator support, and patch
> 4, which adds RTC support.
> 
> How should these two patches be merged?  Mark has reviewed the
> regulator patch 3 and Alexandre has acked the RTC patch 4.
> 
> Thank you.
> 
> 					-Alex

-- 
Yixun Lan (dlan)

