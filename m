Return-Path: <linux-rtc+bounces-2888-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0017A0ACAB
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 00:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 398597A1D95
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jan 2025 23:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DF31C2317;
	Sun, 12 Jan 2025 23:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Oham5EBT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40F2154C0D;
	Sun, 12 Jan 2025 23:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736724943; cv=none; b=PNHVPBS9wjPW+xDxftkGhb1QkKFs2EHOd7SM+W4KS+bGJqqOgbAt4ap+OHYI6fHJopaatCDGLVzC3DydiHU7mN45NEtawnlaLhWTa4MPrgYwYPgPszpcBrcSQ+KD/Chqu8s0WcdDjIwQPBEvHYvit3HfX1RmtD2Mnr1cGBJcCl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736724943; c=relaxed/simple;
	bh=HcsC9tXf4TL6Zkki/ome21MbUBFM1SZ3hoO3K1qADng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrIZe/MP15ijoKVhA+jPKiBH1lH9hnMd1SldBYwk7hdMU6Knrz5/zOr2p9Li8m/vpjyexQrAfcXdDWj8uO3wYp5TWr8BycRrXfah9yOPC5CrQ5MOWSmKHEgMURSJSMcFWb+7ax4aQ4VMjk9CtQ65pbqtR73YClDUaCpeDFY3NA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Oham5EBT; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93E1A20002;
	Sun, 12 Jan 2025 23:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736724939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a87+Qa+zFOoCG7+eaGG+I3SphmFr1f5RzL18ViMCxI8=;
	b=Oham5EBTt7vPNzjgpxWjVCtS1ngOB2nz1SbiLNi11j340AYwlrNonb389GXCux2EVnvTgD
	L7Qgmu1hUyB78SWi6bGIotiz3hjNjgB2lJZTJfx3SLWDDTsj4EP2CsI2WYNHaVWRm+m2RC
	G62zcHyS2TooCtc9jgvY4gO2mVYolggNhybM3MibbFjtj+lR0fl2V0nx1CVOglGF44Feb9
	9AZ0/2UvuDPb5ZozqsNkeTD+jtk5VtzEkmsc7aeV3aQzeLLD58eoudrqBXt+yY7k7DEQxo
	XT2viNI/KcNdWLb5QDGiRyj/WQ5+0BDQOaTeqzByi+TpnyWCuSsZVIrIto3+Bw==
Date: Mon, 13 Jan 2025 00:35:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Satya Priya <quic_c_skakit@quicinc.com>
Subject: Re: [PATCH v3 0/5] x1e80100 RTC support
Message-ID: <202501122335384a545895@mail.local>
References: <20241015004945.3676-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015004945.3676-1-jonathan@marek.ca>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

Did I miss v4 of this series?

On 14/10/2024 20:47:25-0400, Jonathan Marek wrote:
> x1e80100 needs a workaround because the RTC alarm is not owned by HLOS.
> It also needs the same offset workaround as sc8280xp/etc.
> 
> v2: remove duplicated ops and use RTC_FEATURE_ALARM instead
> v3:
>  - renamed flag to qcom,no-alarm
>  - don't remove alarm registers/interrupt from dts
> 
> Jonathan Marek (5):
>   rtc: pm8xxx: implement qcom,no-alarm flag for non-HLOS owned alarm
>   dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
>   arm64: dts: qcom: x1e80100-pmics: enable RTC
>   arm64: dts: qcom: x1e80100-crd: add rtc offset to set rtc time
>   arm64: dts: qcom: x1e78100-t14s: add rtc offset to set rtc time
> 
>  .../bindings/rtc/qcom-pm8xxx-rtc.yaml         |  5 +++
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 11 +++++
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts     | 11 +++++
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi  |  3 +-
>  drivers/rtc/rtc-pm8xxx.c                      | 44 +++++++++++++------
>  5 files changed, 58 insertions(+), 16 deletions(-)
> 
> -- 
> 2.45.1
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

