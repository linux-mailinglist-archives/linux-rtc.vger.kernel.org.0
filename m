Return-Path: <linux-rtc+bounces-5586-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD906CC964B
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 20:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97FD43004B91
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 19:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C68025DD1E;
	Wed, 17 Dec 2025 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D0zzTwtH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D344B1F4CA9
	for <linux-rtc@vger.kernel.org>; Wed, 17 Dec 2025 19:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765999048; cv=none; b=TswUDmHkPS7zxW0mVpO39wsqJgEzjToKaEkL2NaUs1doIUXSD+CpclFfm+VtXTIprJI7GgDBjmDV+4oXZXy2hw1ymv6Xx7YeoeFGGRy7xswa+OCup5z9ub98gaAl1UVhF/siGAAEy/8yLR7PNEOUjNJQ9YErAqNCjBRS8F8fqvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765999048; c=relaxed/simple;
	bh=hAtQiia9jc+As6FMeW0lPsX98+ielv5C2yDHwDT9/kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaNM3maKeb720PotbM/gS5B2g1bYNgrLd+GCWCviotKikzu5vFaxK22rksxc8fjNavK/hsSSeoZ7BZwnRbWsohuCoHWDBFobGZcjGRcnb34VHIYVns4EQ+Bnq30EMdUC6BCetfZPKam90JQ34ZvfjbrM3fi+v15+4+O6UAMw81c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D0zzTwtH; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 44680C1A5A2;
	Wed, 17 Dec 2025 19:16:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B4046072F;
	Wed, 17 Dec 2025 19:17:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0B35102F0AF3;
	Wed, 17 Dec 2025 20:17:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765999037; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=81Abl9aSXqO6VCJZziQzRy2Nkmg+USJz57ws9VtOYYM=;
	b=D0zzTwtH8rkpA3QHSZ9WyVjL9H4YQPxC1eQuACw7FknGFABBOdidh/uDc2GIjb10s1/+4Q
	8ZPJ4dYi61SHm1RHj9hRAXzoRXdFpziIk6EKJdLP3U3gEo8zrHQ9Ia7SYR+iaWBDSFLnMs
	SDasUUQZNP+zfBT1/Dy4zQEckye2TNGlcK15V3U+34nhpF2qaWWO2kIgZtHwaLXagyMRUt
	BeuizFmum9QkckiwVAUvnuF5xdVnVxlUKnftNw9kvsiT2NGO8VVL3QDp/o5yGtOQwiwobe
	drgIRJaqBinjyVUlOx+CSy5kkMmzdrNoWndS9ykDEROKpyJ4jYSJTuiOV4FgEA==
Date: Wed, 17 Dec 2025 20:17:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "T, Harini" <Harini.T@amd.com>
Cc: Tomas Melin <tomas.melin@vaisala.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] rtc: zynqmp: rework read_offset
Message-ID: <202512171917155dba6723@mail.local>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-2-33875c1e385b@vaisala.com>
 <LV5PR12MB98047B0A754AFFFB01163E0992A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
 <353422a2-ba6e-4600-9326-e0cee2098062@vaisala.com>
 <LV5PR12MB980448D3F4109DC0775A56AA92ABA@LV5PR12MB9804.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LV5PR12MB980448D3F4109DC0775A56AA92ABA@LV5PR12MB9804.namprd12.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3

On 17/12/2025 18:14:30+0000, T, Harini wrote:
> [Public]
> 
> Hi,
> 
> > -----Original Message-----
> > From: Tomas Melin <tomas.melin@vaisala.com>
> > Sent: Wednesday, December 10, 2025 5:35 PM
> > To: T, Harini <Harini.T@amd.com>; Alexandre Belloni
> > <alexandre.belloni@bootlin.com>; Simek, Michal <michal.simek@amd.com>
> > Cc: linux-rtc@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 2/4] rtc: zynqmp: rework read_offset
> >
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> >
> >
> > Hi,
> >
> > On 09/12/2025 19:28, T, Harini wrote:
> > > [Public]
> > >
> > > Hi,
> > >
> > >> -----Original Message-----
> > >> From: Tomas Melin <tomas.melin@vaisala.com>
> > >> Sent: Monday, December 1, 2025 6:20 PM
> > >> To: Alexandre Belloni <alexandre.belloni@bootlin.com>; Simek, Michal
> > >> <michal.simek@amd.com>
> > >> Cc: linux-rtc@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > >> linux- kernel@vger.kernel.org; Tomas Melin <tomas.melin@vaisala.com>
> > >> Subject: [PATCH 2/4] rtc: zynqmp: rework read_offset
> > >>
> > >> Caution: This message originated from an External Source. Use proper
> > >> caution when opening attachments, clicking links, or responding.
> > >>
> > >>
> > >> read_offset() was using static frequency for determining the tick
> > >> offset. It was also using remainder from do_div() operation as
> > >> tick_mult value which caused the offset to be incorrect.
> > >>
> > >> At the same time, rework function to improve readability.
> > >>
> > >> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> > >> ---
> > >>  drivers/rtc/rtc-zynqmp.c | 25 ++++++++++++++++---------
> > >>  1 file changed, 16 insertions(+), 9 deletions(-)
> > >>
> > >> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> > >> index
> > >>
> > 856bc1678e7d31144f320ae9f75fc58c742a2a64..7af5f6f99538f961a53ff56
> > bfc6
> > >> 56c907611b900 100644
> > >> --- a/drivers/rtc/rtc-zynqmp.c
> > >> +++ b/drivers/rtc/rtc-zynqmp.c
> > >> @@ -178,21 +178,28 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev
> > >> *xrtcdev)  static int xlnx_rtc_read_offset(struct device *dev, long *offset)  {
> > >>         struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
> > >> -       unsigned long long rtc_ppb = RTC_PPB;
> > >> -       unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
> > >> -       unsigned int calibval;
> > >> +       unsigned int calibval, fract_data, fract_part;
> > > Prefer one variable assignment per line for readability.
> > This is after all quite common practice, and in a function like this where several
> > variables are needed, I would argue that this is more readable than the
> > alternative. Is there some convention I'm not aware of?
> There is no such mandatory convention. It's up to the RTC maintainer.

I don't mind having multiple variable declarations on a single line.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

