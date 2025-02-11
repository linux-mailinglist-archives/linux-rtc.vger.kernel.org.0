Return-Path: <linux-rtc+bounces-3155-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C8BA3124D
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2025 18:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBAE13A330D
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2025 17:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EC025EFB0;
	Tue, 11 Feb 2025 17:01:20 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489401DB34B;
	Tue, 11 Feb 2025 17:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293280; cv=none; b=aD1/K11OtbR5oulQOfUsNQcavlqSIh2mnDZ75XNjmSEib5fYqkTg0vWKwU/COzrnh6zubQhdZvt4Kz6ZP1NusvdlUYBheXdaRecLU9pFJ9MDiwL9oda0KmFc+HGZ7v8CNAFpjqedRdBlG0XO3wmZDqHrwbje+1E87IYF+zdfijg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293280; c=relaxed/simple;
	bh=MGWFFQnkJx5Z+XbrggYPFPnuBYUMbTAAmkBSmam0XBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9jrc5tApXj2R96zs5r0VseesAGRsFBmKh+0rL1nHuzs9Xrnq/nYiFmib4nQ8tJJU+L5n6H5atsEVz8ioXkMmxxmk9pAEsoxt8PTwUbJ7lE5e53roXXTiAqZpje8LvyAIoyyRj4uAUMnACi3DIV3sJFczHR2BR/JJvvqGLZXuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E682113D5;
	Tue, 11 Feb 2025 09:01:38 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 637FA3F5A1;
	Tue, 11 Feb 2025 09:01:15 -0800 (PST)
Date: Tue, 11 Feb 2025 17:01:12 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
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
Message-ID: <Z6uCWK8jMTP7wInM@bogus>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-4-08c50830bac9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-rtc-v1-4-08c50830bac9@nxp.com>

On Mon, Jan 20, 2025 at 10:25:36AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 EVK has two RTCs exported by SCMI BBM protocol. Current driver
> only enables the 1st RTC inside BBNSM module, leaving the board RTC
> not used by Linux.
> 
> To use the 2nd RTC, use 'bbm_info' to get the number of RTCs, register
> them all, and set 'bbnsm' as private info for rtc device to know which
> RTC it is when using rtc_class_ops to access rtc device.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/rtc/rtc-imx-sm-bbm.c | 69 +++++++++++++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-imx-sm-bbm.c b/drivers/rtc/rtc-imx-sm-bbm.c
> index daa472be7c80697aa3cd3432eccef0c877e4c378..a29b30555d0c0581ecaa8b79760209dc780d2f0e 100644
> --- a/drivers/rtc/rtc-imx-sm-bbm.c
> +++ b/drivers/rtc/rtc-imx-sm-bbm.c
> @@ -15,16 +15,18 @@ struct scmi_imx_bbm {
>  	struct rtc_device *rtc_dev;
>  	struct scmi_protocol_handle *ph;
>  	struct notifier_block nb;
> +	u32 bbm_rtc_id;

Is it not same as rtc_dev->id ? Why do you need a copy in this wrapper/
container structure ?

-- 
Regards,
Sudeep

