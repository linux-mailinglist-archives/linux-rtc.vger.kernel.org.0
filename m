Return-Path: <linux-rtc+bounces-1944-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA60B975D01
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 00:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 372BCB24803
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 22:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D04F1BB69C;
	Wed, 11 Sep 2024 22:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HzbCbUIk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240AE78C9D;
	Wed, 11 Sep 2024 22:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726093131; cv=none; b=dJ+FC5mo71RN67BbtNX0OeTg43Cdv3f6lLEu6Nbz/oHnreFuI/yL4DXAXny8N2e0083GXxXVP9qliGzJFVf7O5lA+12abfYIsLSNELL7nZEPCE9hGrw/GjjLxn3IASLEVF1OXYfeJ7HC3sQX+O4z9GJpK8GlbwnWXKO9D6bTNWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726093131; c=relaxed/simple;
	bh=kQNcGWIa5M3+tm+zvFWQO2+mOcbgUyVxV/BKfptYkL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbxXKjCppjvOE5LK966c5uDh8HMf9x4ZITTGyD4yIxPPXEsFRZkE3t8wrlfNJe6A4em46MMvsA3LoXoWWB18CFdvWaPWOHlFb23+abcH0vmsy2ZU7yg2ytX/0p9s2eJTxmdqY18wig7lZYjcLTnF5Z9OYsxJnIBaEKWZ/UDV1eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HzbCbUIk; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8333C40002;
	Wed, 11 Sep 2024 22:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726093127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/U/3mlXLwF6tyfk+FnzzPWhR0uUNH6dDPGh56N0AT/4=;
	b=HzbCbUIkEO39bnfhQwbigDbrueacubYc2w7PFbzd7IgxLNq9o8yQd9QqzcCG2zDARhHxPt
	7p29XXAN4m7RCtoTcnydpRqhyBXIZb1kaxDfwzDwbRYwhP9D5rIwMuYw3KGa0zJGhjKnoq
	0LfaYY8D79ee17tbTLJSn3WZ54SJuwvivTmrFl4IW+Z1e+KlQjwmMULqxk5jGGuzjuUujb
	rYElcdysRVG+myZRZ1d6u67rdJuaEbqr2i/tFEg3R/gWw5g/tvLD6hXSKXgAfSt/6pNFKG
	PDvN8eKBXXQ15MO5btlANFeUHpeJVQI51YcFr74t4yGhc0kPQugiPsZOIIFgRg==
Date: Thu, 12 Sep 2024 00:18:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: sprd,sc2731-rtc: convert to YAML
Message-ID: <172609305460.1547920.7738628328338166199.b4-ty@bootlin.com>
References: <ZolsyEC8eeJWNIb6@standask-GA-A55M-S2HP>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZolsyEC8eeJWNIb6@standask-GA-A55M-S2HP>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sat, 06 Jul 2024 18:11:52 +0200, Stanislav Jakubek wrote:
> Convert the Spreadtrum SC2731 RTC bindings to DT schema.
> Rename file to match compatible.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: sprd,sc2731-rtc: convert to YAML
      https://git.kernel.org/abelloni/c/adab39e1f482

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

