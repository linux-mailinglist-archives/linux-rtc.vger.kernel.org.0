Return-Path: <linux-rtc+bounces-4079-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 200C4AB1B4D
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 19:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92EE01732DC
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 17:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BEB238174;
	Fri,  9 May 2025 17:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqvsMnLl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B377823816A;
	Fri,  9 May 2025 17:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810484; cv=none; b=lAqujhbyN3V4zHOvb7aayAbdHZbXmmjDCbKZgOy64a1KK+gmVq6Xeb02ZIKrN5eZZr9ul6fkEj+Yu8kfVS9IR+rsiEFkzmiOn5rxmfA7yqo8e8JybpixoTDDxseHp5er9Xz4QFq9uK8bYhtaeCBvf3WFq55XNnBv9wtuQqAFQuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810484; c=relaxed/simple;
	bh=t5Ct8fbYqf7nivk1v/By6YiyGXkL5kVBuCkpdKfvD7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXQDwW7YbASjklYSZWnFDvcWPJSQEnz74VKPCwIFh24JpYglGb0lWEI+f6p9JOcNZtefFX4/sNRq5zsuYDm1Hn+lvg4uuhis5J3TXSOvp6TMGmSWR32Q3yycBmWHsKz/iw1olmh1RCxDlB1P6Kj/4c+FPHB46BEHnQ5hCU/zymY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqvsMnLl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB9EC4CEE4;
	Fri,  9 May 2025 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746810484;
	bh=t5Ct8fbYqf7nivk1v/By6YiyGXkL5kVBuCkpdKfvD7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqvsMnLlgG2eLDvsNrtup1Bk04l4KEfn817cBWPRzdtom5rwoPpuBBXXe37p873oP
	 SbIusGhQpbopkkaJh+F5bWtcT6wfV+RAOOOOwgIUaAfKtAdSu1aHSNOcDXGng0FYmU
	 Qjlq1HkJuNzlNMHY4Llij3tKRNhrLWAofFq6WBCTBluudNNs04aPxuEA/x7Yvk/D0k
	 MeMv8wnbMaqNT1fekJygTl9KPAYmJjDRhdEqBeI5ek0jpSpceOTJ1igltxvagv92Mq
	 zG0ZJcJWH0Zh3FOYz+kSiiQIZjjwjlGrgx8yE0IOfVrZDfUDcYFG9Ovv7cxxC8Ym07
	 0AM+wPPXVOHlw==
Date: Fri, 9 May 2025 12:08:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: rtc: qcom-pm8xxx: add uefi-variable
 offset
Message-ID: <174681048159.3790603.652832218930596449.robh@kernel.org>
References: <20250423075143.11157-1-johan+linaro@kernel.org>
 <20250423075143.11157-2-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423075143.11157-2-johan+linaro@kernel.org>


On Wed, 23 Apr 2025 09:51:40 +0200, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
> 
> On platforms where the offset is stored in a Qualcomm specific UEFI
> variable the variables are also accessed in a non-standard way, which
> means that the OS cannot assume that the variable service is available
> by the time the RTC driver probes.
> 
> Add a 'qcom,uefi-rtc-info' boolean flag to indicate that the RTC offset
> is stored in a Qualcomm specific UEFI variable so that the OS can
> determine whether to wait for it to become available.
> 
> The UEFI variable is
> 
> 	882f8c2b-9646-435f-8de5-f208ff80c1bd-RTCInfo
> 
> and holds a 12-byte structure where the first four bytes is a GPS time
> offset in little-endian byte order.
> 
> Link: https://lore.kernel.org/all/aAecIkgmTTlThKEZ@hovoldconsulting.com/
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


