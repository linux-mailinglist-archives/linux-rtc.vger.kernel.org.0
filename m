Return-Path: <linux-rtc+bounces-5083-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 954ACBCD895
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Oct 2025 16:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 407B834F74F
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Oct 2025 14:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD2C238C07;
	Fri, 10 Oct 2025 14:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ae0M31rd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436C91DE8A4;
	Fri, 10 Oct 2025 14:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760106776; cv=none; b=kN9z7yxmlkt1V8vp5oSuTDSr3WF/3Himv6cQjWraQBSjDnE6JUn9V4go6aAEABqEeRb/Jcg7lN1zKfyMALRU0PinSnUJp1GPV8tWy3TDSwlkviuhkStSsaaKT8/94eJ/Z98R3ekZ5JXkOAcCnKjMYlNboMSNOY8fKpmDegLUd6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760106776; c=relaxed/simple;
	bh=T+LRS+QiugIh4I2/N14G4GgJQJfwQzir1ldoMUFkfQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lppg/PBPBX9Kqkud3j8rVz3ZYUyNrr8fMxDB1s3z5FLPGem1uE2naB9dX21rzF71lyCoASGRL3AjyB+BbO5gH2BJ7o+GvIQuPKS/R4veaBfTC9UUqewl7ScL/TuHWQcURStEPKoHjzITjzxYJyMw1yck0FoayWVF6fwMSLW9KSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ae0M31rd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED75C4CEF1;
	Fri, 10 Oct 2025 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760106775;
	bh=T+LRS+QiugIh4I2/N14G4GgJQJfwQzir1ldoMUFkfQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ae0M31rdci3aj6qUaCrf/DOdMKMknXBkNkP5tIQEF0xiq05gWmp8FEoP7XxXQlK7G
	 bO5nmWAj6TwciNjW006Q2Ai8Es2lNlQfhzME0fwVnjkqAACxqRAovNT8pedYIw5W1z
	 Dyl3ZDKmzfJTFbBzKpC4M1cBxDBkD3avOlWm/BbMNndVRpha8+iC/kvC5VP5+vjlTC
	 9UlBnZycnqYcwbGZMuy6qghXRPAVFtdj0erNhMCISRQptl+FzTPCNuCKRLK5FSUPl+
	 a9s3650zvUXziCPlY29NvhTMb5jbqGc6dc/7CTIg1yKXol3HvYYdAmF+r5NAHveqlZ
	 Gxv8r5jB1uVKQ==
Date: Fri, 10 Oct 2025 09:32:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
Message-ID: <176010677341.249054.11003330189373181817.robh@kernel.org>
References: <20251007135738.487694-1-shgarg@nvidia.com>
 <20251007135738.487694-2-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007135738.487694-2-shgarg@nvidia.com>


On Tue, 07 Oct 2025 13:57:35 +0000, Shubhi Garg wrote:
> Add device tree bindings for NVIDIA VRS (Voltage Regulator Specification)
> RTC device. NVIDIA VRS is a Power Management IC (PMIC) that implements a
> power sequencing solution with I2C interface. The device includes RTC
> which provides functionality to get/set system time, retain system
> time across boot, wake system from suspend and shutdown state.
> 
> Supported platforms:
> - NVIDIA Jetson AGX Orin Developer Kit
> - NVIDIA IGX Orin Development Kit
> - NVIDIA Jetson Orin NX Developer Kit
> - NVIDIA Jetson Orin Nano Developer Kit
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v7:
> - dt binding file name fix to keep same as compatible
> 
> v6:
> - compatible name fixes to "nvidia,vrs-10"
> - changed dtb node name to pmic@3c
> 
> v5:
> - moved device tree bindings from mfd to rtc
> - changed dtb node name to rtc@3c
> - changed compatible string to "nvidia,vrs10-rtc"
> 
> v4:
> - no changes
> 
> v3:
> - fixed device tree node name to generic "pmic@3c"
> - fixed indentation
> 
> v2:
> - fixed copyrights
> - updated description with RTC information
> - added status node in dtb node example
> 
>  .../bindings/rtc/nvidia,vrs-10.yaml           | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


