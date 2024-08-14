Return-Path: <linux-rtc+bounces-1670-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F2C9517D7
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Aug 2024 11:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2249285ABF
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Aug 2024 09:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971C616131A;
	Wed, 14 Aug 2024 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QyWuE/h8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4406165EE6;
	Wed, 14 Aug 2024 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723628378; cv=none; b=XrAOmz1ERBe4/HU9WWGEDfxNcjlLREoJ3lb1QtLZjngUMohvc+anlNnvyvS5fxL3BAkTGO5L4R0PE71fN2JhR6abED3cdi2muvbc+QhOvOq1cnPEhmbWy8FEHQp3EnB0v9apLONZ6VxjY2/fbCZH9aVeq/+km6FAZ4pRXo+rEv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723628378; c=relaxed/simple;
	bh=pAIuaobLu99XMAUHdxa2PKr7FA4p97jqsRB7Qb1ubKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGaqiIwXXnCdqae18VE4z22mgbaNeuqpmfLTNanV63SRep47752B+aPhq9ceeUNmwt6Bk41eZyqKVN4a+eOI5ydJkvXi6cmKR5sFspOHL9hbbDvrDxW+ZdeYIZ381ullt2u5DuEH0KzFMorYL5FoDxz1et/Z0IjEMa97Ttd94mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QyWuE/h8; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69F1B60006;
	Wed, 14 Aug 2024 09:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723628374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E7PpVU2JAYLxKsnkxtdTr7GFE8pxjv8qTyuS3hDNH+Q=;
	b=QyWuE/h8cmYYLNBdFzDeXZuImHX6/0ZCaGkoN2n9uZIojGLqzZ28P8Lkj4qqSVh6jZyXyJ
	iEAFvNjeQ9THhunepKlqhY/tvLoEQ5ZdrcV6X1Akgs/8Yftgdz+v98VWYiizXhPkVdAlWr
	jo9Ugb9Fl96+8jV6sqnD4Ua/cXXC02+DQTOy/jyyS6Aljfmp8eYrQ6YFry0DdOFdSuv4+z
	At5DFincINzpg9GEPgiWuGEIsE/4mZ/FEdGwDyE8+tKpIQUPzzj6MvfR0255bPTdsEX41t
	/GwIN+VMs2mFzkAyz72hRO6JpKZ1xMHKuB1Cw+iyCzbC9QwrQFwboEiJ3qumTA==
Date: Wed, 14 Aug 2024 11:39:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: Re: [PATCH v3 0/4] rtc: stm32: add pinctrl interface to handle RTC
 outs
Message-ID: <172362832901.24631.16096665387858981074.b4-ty@bootlin.com>
References: <20240722160022.454226-1-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722160022.454226-1-valentin.caron@foss.st.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 22 Jul 2024 18:00:18 +0200, Valentin Caron wrote:
> This series adds a pinctrl/pinmux interface to control STM32 RTC outputs.
> 
> Theses two signals output are possible:
>  - LSCO (Low Speed Clock Output) that allow to output LSE clock on a pin.
>    On STM32MPU Discovery boards, this feature is used to generate a clock
>    to Wifi/Bluetooth module.
>  - Alarm out that allow to send a pulse on a pin when alarm A of the RTC
>    expires.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: rtc: stm32: describe pinmux nodes
      https://git.kernel.org/abelloni/c/5b19519d4e6f
[2/4] rtc: stm32: add pinctrl and pinmux interfaces
      https://git.kernel.org/abelloni/c/16ad2bc09efb
[3/4] rtc: stm32: add Low Speed Clock Output (LSCO) support
      https://git.kernel.org/abelloni/c/bb7b0df2be5c
[4/4] rtc: stm32: add alarm A out feature
      https://git.kernel.org/abelloni/c/04dcadb87da6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

