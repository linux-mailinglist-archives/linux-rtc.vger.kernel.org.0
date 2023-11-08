Return-Path: <linux-rtc+bounces-245-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D45027E5C35
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 18:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB9351C20D92
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 17:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E0C31A98;
	Wed,  8 Nov 2023 17:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K6WYIAAi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CB13033B;
	Wed,  8 Nov 2023 17:17:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B68182;
	Wed,  8 Nov 2023 09:17:28 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D92360002;
	Wed,  8 Nov 2023 17:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699463846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/K9DY4Xofz355OSphUQ2A4G+xDqv5gWtC6yqDwtdns=;
	b=K6WYIAAixvzsG1Zw4ezkpdba3dRldhUMbZPrTF7vJGleKDll2kD+sggJk+Ro7yoZD2MFec
	IVOzpX5kgijw5zeNTgNCUxtGSwSZyWCZC3QAhK/CKvlXIbBDav5qaU5qT15r55cUWYyrY2
	0bMSHXyS2AUlglh23zLKHJUnhgIKQ5gUyHM8PqWA38C9RCxihcYxBwSLMpSw0dHtrdzEuM
	gurUvKsXJxD6zMCe5yAJR3y2scwv2K0gLKciKw8jzOzRPG6hM/3Q9dj+CfQc+8bb315zx5
	0GIDVMuVLX24Kc3f3p3b85MHdG1Lb3epdI0XSC0bTSp/LNNyZgJiXWHzGAHBhQ==
Date: Wed, 8 Nov 2023 18:17:25 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Romain Perier <romain.perier@gmail.com>
Cc: Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Daniel Palmer <daniel@0x0f.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: rtc: Add Mstar SSD202D RTC
Message-ID: <202311081717259f115541@mail.local>
References: <20230913151606.69494-1-romain.perier@gmail.com>
 <20230913151606.69494-3-romain.perier@gmail.com>
 <20230913-depress-bootlace-6b88bfd83966@spud>
 <CABgxDoK2T3xkKYDVeqRuDXMHfVEJcRkkBOBBkMJ5=XUv9Y5MsQ@mail.gmail.com>
 <20230914-coagulant-unbroken-2461d32274a1@wendy>
 <CABgxDoJhfKQesDtV3WJ=C-DPB8P+0LDmzbY9Zy909yr3v1FQKQ@mail.gmail.com>
 <20231108-emergency-poker-8be712fdbf8e@spud>
 <CABgxDoL3_-RzqSMQgWzvUa=tdjsrSVCPUt0ZtE=YtNDHBPsy5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgxDoL3_-RzqSMQgWzvUa=tdjsrSVCPUt0ZtE=YtNDHBPsy5w@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 08/11/2023 17:55:06+0100, Romain Perier wrote:
> Le mer. 8 nov. 2023 à 16:44, Conor Dooley <conor@kernel.org> a écrit :
> >
> > On Wed, Nov 08, 2023 at 02:27:37PM +0100, Romain Perier wrote:
> > > Hi,
> > >
> > > Alexandre seems to be okay with the current (merged) dt-binding, what
> > > do I do ? I can send a v3 for trivial-rtc.yaml that's not a problem
> > > for me but both of you seem to disagree :)
> >
> > Meh, I wouldn't waste your time moving it.
> 
> Ok, so I will just send a v3 with an update of the MAINTAINERS file
> for the driver (I have completely forgot, my bad)
> 

v2 is already upstream:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/rtc/rtc-ssd202d.c?id=ebf6255868e6141c737cacb8d62b0b347f344877

> Regards,
> Romain

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

