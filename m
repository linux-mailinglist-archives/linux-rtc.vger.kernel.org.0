Return-Path: <linux-rtc+bounces-3049-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EB0A1CF4B
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Jan 2025 01:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D67861884CB0
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Jan 2025 00:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4D223CE;
	Mon, 27 Jan 2025 00:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNtV65Di"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AAB10E3;
	Mon, 27 Jan 2025 00:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737937228; cv=none; b=Pg10mRdqHvftC2UVlrpj6ZSQ6O6ks6YB8Fl7QW3C9bU12nitmZNPg15H3q3vE+ijvKRTXfewbBcn4VpwwSgg041ILBXI9WuVCpvFqTnOuV06voaAEKOgTktJrTE2da1LlQ0sFNtzmABLBTSO2lzG/+a24zSXN0tspwuS91dNkX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737937228; c=relaxed/simple;
	bh=pvbhsvlel3bVPxM0Y048DFc6UY6hgAQodODCIgqQqbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/A6E6pIOvwOA5p7hG0HQpYo6huO+NtmDY53li1GXNQoeMI+g71yvGk5ZG85k3j/Dw/4yii8L7P4jIPBKkWrH0I+noiRMGlzXSfp4wM08plABSgLMSluxnQb2CgYfYN8vjaIwXs2pFif319agwKZxjwlBC4yi26CbTRXNVyG04o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNtV65Di; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8010EC4CED3;
	Mon, 27 Jan 2025 00:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737937227;
	bh=pvbhsvlel3bVPxM0Y048DFc6UY6hgAQodODCIgqQqbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNtV65DiPS+iHf2jLd8v9TJWlrzIXfObbR52fjtOenBTdGXmbYNyt49PqNTXADrFs
	 2fftvfdeHLRViAoXKpgr37EwF0xK03whe/0hjiXkI+Ms03NFUOqUtVDBMV2BWPw+K/
	 YE117Ah9BkqbcZKKzyzrwH2Z99tb/YkZokizvcakHxJcAqaEN3QF38DxgHq3hk7l/G
	 XJCcvIldQoD1HpLlQz9gAE32aduMLfuo8fYFmQ8p9KuHvLVI2fNuNmpfBRQeDx5dvi
	 MONJYgKFgWNBoWTnX7yHi2nfHNmOhzVWZGgErikRuKh8Hg+w7q5Ezb1FPz4o3ZExHc
	 yr60JaJyzB4aA==
Date: Sun, 26 Jan 2025 18:20:26 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: enable rtc
Message-ID: <20250127002026.GA2534668-robh@kernel.org>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120144152.11949-1-johan+linaro@kernel.org>

On Mon, Jan 20, 2025 at 03:41:45PM +0100, Johan Hovold wrote:
> This series adds support for utilising the UEFI firmware RTC offset to
> the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> Elite machines.
> 
> Included is also a patch to switch the Lenovo ThinkPad X13s over to
> using the UEFI offset.
> 
> The RTCs in many Qualcomm devices are effectively broken due to the time
> registers being read-only. Instead some other non-volatile memory can be
> used to store an offset which a driver can take into account. On Windows
> on Arm laptops, the UEFI firmware (and Windows) use a UEFI variable for
> storing such an offset.
> 
> When RTC support for the X13s was added two years ago we did not yet
> have UEFI variable support for these machines in mainline and there were
> also some concerns regarding flash wear. [1] As not all Qualcomm
> platforms have UEFI firmware anyway, we instead opted to use a PMIC
> scratch register for storing the offset. [2]
> 
> On the UEFI machines in question this is however arguable not correct
> as it means that the RTC time can differ between the UEFI firmware (and
> Windows) and Linux.
> 
> Now that the (reverse engineered) UEFI variable implementation has been
> merged and thoroughly tested, let's switch to using that to store the
> RTC offset also on Linux. The flash wear concerns can be mitigated by
> deferring writes due to clock drift until shutdown.
> 
> Note that this also avoids having to wait for months for Qualcomm to
> provide a free PMIC SDAM scratch register for X1E and future platforms,
> and specifically allows us to enable the RTC on X1E laptops today.
> 
> Rob had some concerns about adding a DT property for indicating that a
> machine uses UEFI for storing the offset and suggested that the driver
> should probe for this instead. Unfortunately, this is easier said than
> done given that UEFI variable support itself is probed for and may not
> be available until after the RTC driver probes.

This information would be useful in the binding commit...

Seems like something I would say, but this is v1 and I have no memory of 
discussing this. I would also say probe ordering is not a DT problem, 
but sounds like an OS problem. Aren't there other things needing EFI 
variables earlyish too? Do you really want to have to update the DT to 
enable this?

OTOH, it's one property, meh.

Rob

