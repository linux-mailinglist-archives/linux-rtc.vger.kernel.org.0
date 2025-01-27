Return-Path: <linux-rtc+bounces-3052-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD09A1DBBF
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Jan 2025 19:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE4703A6E3D
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Jan 2025 18:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B6418CBFB;
	Mon, 27 Jan 2025 18:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwRBOSpw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86BB18B48B;
	Mon, 27 Jan 2025 18:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738000828; cv=none; b=ERPDbknxl/y1ZYv+ibWOWWNAyVBkv10pEAsXb3xwhuzoAfJ4yMP5IsTEjFh9QqC25qbVMxeD3PPiKi2Q04kXC4A9Jpv7uU6EZk0UVq7Yl9YT3u+uOgHZaXqGME7E9tG/530SHeuuPij1SVhdjTXZfyE540PX3ObcsOzmhpESeiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738000828; c=relaxed/simple;
	bh=46MM4+5JRn0cpDs6bLnICSZXnvQ6YkR3OrnqzcdZnsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAwacv5ZgtufgAoIny5BuxDAJH0knp1L6csvKumYS1Wn+S8Fi6r8bmXARjRXXQwQRiiSS192fqp3HVNw66WITUjn7Ia7KQ0lR2wBPYYHB1c+q/8BN1c8JfoO6oBKrnoL4OWbx7FWAfXtiWvoupSo748DE75FnQCyCtBYWxThv0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwRBOSpw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD2DC4CEE0;
	Mon, 27 Jan 2025 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738000828;
	bh=46MM4+5JRn0cpDs6bLnICSZXnvQ6YkR3OrnqzcdZnsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwRBOSpwt7hCsv1k1jcYSgAy8tFJL1iDXlvdKOYENfzr/+6PsmmfUEEXTM6xcIc+Y
	 fSq+37dib1m9fLSymvxt/HZoc2mArT586nOSh+72O3pSzJQyMrPbKdTFOhJcR9UxKG
	 9/Ze/8XxsVX+OLPuuKPTJetdRPJCNt1tt8KJvdca/pz7PlsZgHaWkRV4zUA90jeSdA
	 yG1aono+hVgXx4ZmNYFWBnFXa5GNLXMaQgLfnIOmik2YAwC02blYgYQd93gnau+d1w
	 n9EoYauZOAIxKO3BaA55DUi+0KrQrukm4Gnj5ZSapXX19oKxSBF42OoDKxM+y+K9Hh
	 lWiFXOxYX6Ldg==
Date: Mon, 27 Jan 2025 12:00:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: rtc: qcom-pm8xxx: document
 qcom,no-alarm flag
Message-ID: <173800082586.538050.18039812124468938594.robh@kernel.org>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-3-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120144152.11949-3-johan+linaro@kernel.org>


On Mon, 20 Jan 2025 15:41:47 +0100, Johan Hovold wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
> Thus writing to RTC alarm registers and receiving alarm interrupts is not
> possible.
> 
> Add a qcom,no-alarm flag to support RTC on this platform.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Link: https://lore.kernel.org/r/20241015004945.3676-3-jonathan@marek.ca
> [ johan: move vendor property; use boolean; reword description ]
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


