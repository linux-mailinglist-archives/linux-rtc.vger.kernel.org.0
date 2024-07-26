Return-Path: <linux-rtc+bounces-1625-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FF193DA2D
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 23:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5015286149
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 21:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B4A149C4E;
	Fri, 26 Jul 2024 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LngetdCk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FCD748A;
	Fri, 26 Jul 2024 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722029394; cv=none; b=j3mZH5itnpnXeI50Mjrk5dxpxQLkBijoZ4u+WSCdTKlw4QnydVVzZH9cGoROJ4X5GiCXif2T+5VBrIkVTOPJ9jQosJ7vp7YPa1AyqRHbh7/1NaLG7eyyGQN26f92o7ci4zDaXGg6psDAHaAxluu+TklLs6RaGRH9ZyK5O1rmZHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722029394; c=relaxed/simple;
	bh=v96/KSGBYGKeHUV8VjqZ4HHMfBAyCisN55Q/k8OWemc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGvDILWd/dOxS45y1ErBqKG4j7KhmfP8HoPlIgqESqSlLsGeadnBCrBJ9I+n3olKDKffmedcD+01H+LnsN1hLehaw72zr4FXuS1Y223DmK+/Z98YawALEJP2HsQXCMZO4rUEFD3zsXa1XaSJw4Bph5n8faIGs3+o9S1ec5qqp4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LngetdCk; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43154C0002;
	Fri, 26 Jul 2024 21:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722029389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hitksc1k8zJDuSSoX0yIY4W/4pfIXgyE3bly4t52hoE=;
	b=LngetdCkJslhLHvz9xsXex1d4COAgjbMr9zUWs7jqRjIgSlnINmoE9iLlETh1Tb9b05rQP
	MjhIwQPXdKysGD8NCwMZIHEpUv8GsRsBzwhTqfUyq1yP0uhyqM4d7jETvH/YmH+m6+Z//x
	ihYBcCUFIjIdXmqfG7PwDsdbhndxs0csN5jCVAEltvjHRkiLY0fWdeYiLNv3d/xvF7U6Bv
	A7TGIb7gVCLpwz0Gly/m3K+EY6Em4g2tZRe8bEhQOxN+PU0CvpaR5SYSiELClX4XLhLAbO
	dPiJUAbUq1Zh2T0kBvyFPkKSsosdv17u1iPwhLepc3443qtLRy0UbF5zSzLi2g==
Date: Fri, 26 Jul 2024 23:29:49 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Valentin Caron <valentin.caron@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: Re: [PATCH v3 0/4] rtc: stm32: add pinctrl interface to handle RTC
 outs
Message-ID: <20240726212949fc918694@mail.local>
References: <20240722160022.454226-1-valentin.caron@foss.st.com>
 <CACRpkdbphGF_2P+bezdaYLE4n_1Z5NYjJfcuCh01ysB6QHC=qQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbphGF_2P+bezdaYLE4n_1Z5NYjJfcuCh01ysB6QHC=qQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Linus,

On 26/07/2024 22:37:21+0200, Linus Walleij wrote:
> On Mon, Jul 22, 2024 at 6:02 PM Valentin Caron
> <valentin.caron@foss.st.com> wrote:
> 
> > This series adds a pinctrl/pinmux interface to control STM32 RTC outputs.
> 
> Interesting! I think it is the first pin controller outside on
> drivers/pinctrl in the kernel tree.

Actually, we have rtc-omap which does this too. I've been pushing for
more RTC to do this instead of defining custom dt bindings to do what
boils down to pinmuxing.

> 
> Please include me and the linux-gpio@vger.kernel.org list in
> subsequent postings, I want to be sure what gets merged here
> and I only noticed this from the LWN driver patches summary.


I'll also ensure you get copied on pinctrl related patches.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

