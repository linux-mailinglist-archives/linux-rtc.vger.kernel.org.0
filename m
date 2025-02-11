Return-Path: <linux-rtc+bounces-3154-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D92A31245
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2025 18:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5A17163168
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2025 17:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB51260A2C;
	Tue, 11 Feb 2025 17:00:01 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F66B260A21;
	Tue, 11 Feb 2025 16:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293201; cv=none; b=Tf789v9PZpeKNHDAlT7ptWaBhP9ZW72uju/tgCfiBEmyTMUzV/rogncw3IKaud0TvXqcMJm0GMNx+PO7gDh0qQC9oCC2WfnSkBYYkbBqfWlP3RQONGWaXLtjrIA9bXSod12/0v2nYzwjBZqm1BqW30tz50KvKo06QFYkauluTpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293201; c=relaxed/simple;
	bh=OGUbdauHwyEPpmKvlo6LqSZ4UZPoHN1kXlQD8TSts+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8RG11Ja1fcH/ZcbIBeMB4jrm5WGDtq04Kyw+1t9GLMUcPokAv9QiXgIh4pkSQcRk3sa6g11QjxUKRcX2+fG3XZYAdijndyTaYJa1+HWAwISCfTiGvkn0QPHLdcVWhrhQm4Tex1otxG37a3c8U+/PchKtGT7qhVy8WJaN6KHoOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17B7613D5;
	Tue, 11 Feb 2025 09:00:20 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 874083F5A1;
	Tue, 11 Feb 2025 08:59:56 -0800 (PST)
Date: Tue, 11 Feb 2025 16:59:53 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Message-ID: <Z6uCCeG2d395ZGDS@bogus>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Tue, Jan 21, 2025 at 02:31:55PM +0000, Peng Fan wrote:
> 
> It is the i.MX SCMI Protocol exports two RTCs using one protocol.
> 
> Two RTC devices are created, but share one parent device.
> 
> Do you mean each RTC device should have a unique parent device?
>

Can you point where is this check for unique parent ? I am not so familiar
with RTC but I couldn't find myself with quick search.

-- 
Regards,
Sudeep

