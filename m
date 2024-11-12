Return-Path: <linux-rtc+bounces-2532-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E15769C5B2C
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 16:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE207B6766C
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 14:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE3A1FEFC1;
	Tue, 12 Nov 2024 14:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Fajmlr73"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E4D1FE103;
	Tue, 12 Nov 2024 14:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731422450; cv=none; b=VaW7FahFQxaVPXmyydRrVDyYJudfUa26LniqXQx3MXOWE60VVqeH/l71IWLS+LGXx+flmZywkveaYsw2ejCXgirkjbGMllAJisRwNMIjvT92QePbt6MkqmGns6ZaZsbrJi03tW2dkBfiHwPCYzOVGX3fwXIPOWZmM7ZBKhTkMYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731422450; c=relaxed/simple;
	bh=COoOuj+jFQPeqRyljb5rMOtI1BxvmrGJEHBKEmrwSDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nj7cZ4EDo0XxgPw1GS86EsQ86aJRdwv+PlagDFWe6XLlGZJEswx22SYUT3FD8Gh5GAJpWpil1O1kvUQJhVvEm2V62X1JClucobupz80urC0zBM3bHOho5CYz+eB0FAdtpuyuel2RPpqBlnadl9lypwtXd2rXe5dN6J9YUdH5UBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Fajmlr73; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 838DA1C0007;
	Tue, 12 Nov 2024 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731422445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nTKxTYuHxpsEfa5uoloGupR++LJq3u7SmDUHPOZk4Zo=;
	b=Fajmlr73GJK0QIOTpMqiS/IXudOf0W2iauFh+mvW+N2zb7/4u9almQ1luDrG6EJLhDzHQT
	0Roq/G7OzftOB99PzTD20VAAC7teWtZd78uQ1FJtgH1MhaKHHwTMhs3Ju6hqPBU3oabDLd
	T0JnRy/G6Vxd35RCj/nXsyCwS9Dk4+XhbfyqPNGPulx8xBveJMAKipKSRNJzW8moJLZ8yM
	TWcLt36Yuk6jPIUISzyxZCt0/gfJDk5smXSr6sgoeUcYhjceeyV4WSUvFwGGmh+QmPGfm4
	rEuIUJKGLWEfuHrRgLvG6Z3Tfvlu8b2GiFbGs3k/BSiN9TdFzgkh4BI0eYm/rg==
Date: Tue, 12 Nov 2024 15:40:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 0/3] support for amlogic rtc
Message-ID: <173142240907.3446466.9470229685878821309.b4-ty@bootlin.com>
References: <20241112-rtc-v6-0-a71b60d2f354@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-rtc-v6-0-a71b60d2f354@amlogic.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 12 Nov 2024 11:10:13 +0800, Xianwei Zhao wrote:
> Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.
> 
> 

Applied, thanks!

[1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
      https://git.kernel.org/abelloni/c/ce57cf7319e5
[2/3] rtc: support for the Amlogic on-chip RTC
      https://git.kernel.org/abelloni/c/c89ac9182ee2
[3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
      https://git.kernel.org/abelloni/c/a012d430a4f2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

