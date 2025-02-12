Return-Path: <linux-rtc+bounces-3175-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF668A323C8
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 11:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E1CD3A5145
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 10:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DCD1F12EC;
	Wed, 12 Feb 2025 10:44:46 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9325420896E;
	Wed, 12 Feb 2025 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739357086; cv=none; b=X0E0qTCIPf/cxZMVzWqSEoxVbsoihCgq/Dv7QkSeCiIG4Cfcs2Fgqm3E8sM9iU1Ci1PC2on+bt+I+cnlN5L55Lq/czeQ8SJbM2GM4eWGPuhvrH09jmZc4tS+AR7vzJxcZGa1ZioxYJVvjxIOYOat2GIGSVD5pRh9KDIykYJ4CZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739357086; c=relaxed/simple;
	bh=qVVPJPtnqsJdp2z+AfZj8jLWGGvu1Agn7BuY6aOLCS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3wvUk7Zj/95q6JbisDHEZgM/VBaFz2vjlZahe4V8pELTnz2gTT4B+dYUZPp8pKbO4N+SCNKEV3BCHux+uYkwncoFg90s5jbkMcoHzDCe2QWV8vnCXk49XNf2McNlNc58mQ7rtbbUya2Dp37dfEMbPZrUqr2J+8lSswWqGRKFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0147F12FC;
	Wed, 12 Feb 2025 02:45:04 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5E1E3F6A8;
	Wed, 12 Feb 2025 02:44:40 -0800 (PST)
Date: Wed, 12 Feb 2025 10:44:37 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/4] rtc: imx-sm-bbm: Support multiple RTCs
Message-ID: <Z6x7lemv2y8iMZZA@bogus>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-4-08c50830bac9@nxp.com>
 <Z6uCWK8jMTP7wInM@bogus>
 <20250212064117.GC15796@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212064117.GC15796@localhost.localdomain>

On Wed, Feb 12, 2025 at 02:41:17PM +0800, Peng Fan wrote:
> On Tue, Feb 11, 2025 at 05:01:12PM +0000, Sudeep Holla wrote:
> >On Mon, Jan 20, 2025 at 10:25:36AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> i.MX95 EVK has two RTCs exported by SCMI BBM protocol. Current driver
> >> only enables the 1st RTC inside BBNSM module, leaving the board RTC
> >> not used by Linux.
> >> 
> >> To use the 2nd RTC, use 'bbm_info' to get the number of RTCs, register
> >> them all, and set 'bbnsm' as private info for rtc device to know which
> >> RTC it is when using rtc_class_ops to access rtc device.
> >> 
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  drivers/rtc/rtc-imx-sm-bbm.c | 69 +++++++++++++++++++++++++++-----------------
> >>  1 file changed, 43 insertions(+), 26 deletions(-)
> >> 
> >> diff --git a/drivers/rtc/rtc-imx-sm-bbm.c b/drivers/rtc/rtc-imx-sm-bbm.c
> >> index daa472be7c80697aa3cd3432eccef0c877e4c378..a29b30555d0c0581ecaa8b79760209dc780d2f0e 100644
> >> --- a/drivers/rtc/rtc-imx-sm-bbm.c
> >> +++ b/drivers/rtc/rtc-imx-sm-bbm.c
> >> @@ -15,16 +15,18 @@ struct scmi_imx_bbm {
> >>  	struct rtc_device *rtc_dev;
> >>  	struct scmi_protocol_handle *ph;
> >>  	struct notifier_block nb;
> >> +	u32 bbm_rtc_id;
> >
> >Is it not same as rtc_dev->id ? Why do you need a copy in this wrapper/
> >container structure ?
> 
> In theroy yes. The current system I use that all RTCs are managed by BBM
> protocol. So only two RTCs are registered.
> 
> In case there is other RTCs that not managed BBM, the rtc_dev->id
> will not be equal to bbm_rtc_id.
> 
> For example RTC1 is directly managed by Linux, RTC0 is managed by BBM.
> 
> The RTC1 is probed first, so its rtc_dev->id is 0. But from BBM protocol,
> the RTC0 use id 0 for BBM SCMI server to handle the RTC0.
> 
> I maybe overthinking here. But to avoid potential issues, I would like to
> keep bbm_rtc_id.
> 

Fair enough, I didn't think of this mix(firmware controlled RTC + Linux
controlled ones).

--
Regards,
Sudeep

