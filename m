Return-Path: <linux-rtc+bounces-3522-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 902F8A64D5A
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 12:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB8B118962AB
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 11:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8B423536A;
	Mon, 17 Mar 2025 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRzjXNDQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786FB17D346;
	Mon, 17 Mar 2025 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212355; cv=none; b=L21AEndYrmHAHmw8J4+gGVLPrVQjrVA3HcsHrp3p0WQ1rnoPYPQJcar4Tf7J4YOAfJ9slXp6XldRu8Y2a5p5pGWBtlDKB35QLcMR3GD4WQYkonahPmS9k9tPWBJ4pkeEmXPxpiJpnLO05Oo0HpyUm6bUHWRWDH7K2OtGDWwdWeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212355; c=relaxed/simple;
	bh=+BZN9v8CEMKfRleFN5iHfGa7ErAwh4EqF1+Y/dCuAFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNCvE3x9PE8HBpYvTnGvIGrEeVMowO2dmnzkJhZlQcuVYXhU2vMDvqHTTEStJ5/HJwq9+huilQh4bCu58EtSx2oll3hanxsafVk4tvyjl2Sh1TJEXVAtG4p+IEJeDbJ12np8Hgjf+onNl/1wpgXJOP4BSj/zdR7gPUd/aaDbhpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRzjXNDQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3796C4CEE3;
	Mon, 17 Mar 2025 11:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742212355;
	bh=+BZN9v8CEMKfRleFN5iHfGa7ErAwh4EqF1+Y/dCuAFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BRzjXNDQxdpnohsMejU9dPD1eMbwHr3nHrIkyArvVg9CjVuh7lCQbs03Q0l4wScr+
	 fbztTE9Cr2arU0fvSks9ImlRbYta7WKAX0LxhMu5eyDjoS1G+TW1mfQ3zdfMhmO/XH
	 V0HmjRdtTRZQd/158wAxMM2ENYdsbzsVclKPaDToSbB3eNg5gUDKVd3bpLPxiaAD9H
	 9DtXRLVzXgRM7AUMWpqB698fkctGV6iawdmJtDBa1hHRWKMLkKivMpFDClKb9KnUK6
	 DDFugeGt4vD/7oW8ll8Xer5iPB6eopFuGH89DVFYEPsShquK08+ssVDSctVwvesyQt
	 7ecgPl4QMT1pw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tu91F-000000006ia-0aYD;
	Mon, 17 Mar 2025 12:52:33 +0100
Date: Mon, 17 Mar 2025 12:52:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Joel Stanley <joel@jms.id.au>, Sebastian Reichel <sre@kernel.org>,
	Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: x1e80100: enable rtc
Message-ID: <Z9gNAQ0VlWVMqS8N@hovoldconsulting.com>
References: <20250219134118.31017-1-johan+linaro@kernel.org>
 <Z87avd83XTYQYIP8@hovoldconsulting.com>
 <2025031711065662ac4072@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025031711065662ac4072@mail.local>

On Mon, Mar 17, 2025 at 12:06:56PM +0100, Alexandre Belloni wrote:
> On 10/03/2025 13:27:41+0100, Johan Hovold wrote:
> > Hi Alexandre,
> > 
> > On Wed, Feb 19, 2025 at 02:41:12PM +0100, Johan Hovold wrote:
> > > This series adds support for utilising the UEFI firmware RTC offset to
> > > the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> > > Elite machines.
> > 
> > Do you think you could pick up the driver and binding changes here so
> > that Bjorn can take the DT patches for 6.15?
> 
> This is taken now but I had to rebase on top of patches I already took,
> please verify.

Looks good except for the device_init_wakeup() call which you had
converted to devm_device_init_wakeup(). I'll comment on your follow-up
fix directly.

Thanks!

Johan

