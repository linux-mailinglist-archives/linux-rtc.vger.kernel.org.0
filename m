Return-Path: <linux-rtc+bounces-2182-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11899CC2C
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2024 16:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B878B1F2397F
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2024 14:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881991AAE27;
	Mon, 14 Oct 2024 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCIgRGZT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5477F1AAE0D;
	Mon, 14 Oct 2024 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728914727; cv=none; b=oTtpuEcDMwBBnWrK5ZEGBiatsu23wk4nk/voOWYvSppZwtFwuGV2UtEgivQqs8LubHCE5HOga8XEIGEwmThQu9v5CIBOdk1nWIFwGf2p8B3hwewh+BNMYq3lE898dA5rfN/FdrOYJ3EVb8XRo3mJZXDl2CbgLKyHtbWlPVG28sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728914727; c=relaxed/simple;
	bh=FrAUZ6O/V/lXw0NwJifKLZLDWojL+cemCyeVYiUVEEs=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=QyCqwanFhJY5RzfT3mpf9C0gLTEyxFMJq1bTACsAYKJmnCtvRCF3wRlGT9Ityy94CreDFkGxqI6Cqava+/mkRg9Cs8FMWpVj6HOXJheclKlDnKMxn90BinpSOclxJX/50eE0mw+Aldsql1JPdPtBl3XIWCN63AB0YiZHcD8sfMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCIgRGZT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD977C4CED0;
	Mon, 14 Oct 2024 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728914727;
	bh=FrAUZ6O/V/lXw0NwJifKLZLDWojL+cemCyeVYiUVEEs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=MCIgRGZTKXXFXbOI3Rb140Yjbq9IDGh0NEOaXMXPUstLAcdG2JrsnxsAs73RbJ0TW
	 NvZ5MmuZVLYzGHKxbIYsT5vpSAI6fBpH3+P5NtJAD5JXPfzp2gGSSTKcXzHwDV78b4
	 ccBfg/CBfwSvAAfkxSEgd3C+5oJNQMJ+s12+mvcUfSMJjATuGsf0TlQkdVBshvVvm/
	 hCxwTHlJkLFlKZkhGjEy/qiIUrqFO5+EMT8YJ/15L2I2T5DoUQXb920ZZD1+D9Uy8p
	 6PFPo52rTWMYVXExCUdJFw6U3V8Ww6Po/+vY2Nm2JfE4mD8rKE9lSQHzQOn2ZJYwur
	 09eIdnzXkybFA==
Date: Mon, 14 Oct 2024 09:05:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Satya Priya <quic_c_skakit@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20241013051859.22800-1-jonathan@marek.ca>
References: <20241013051859.22800-1-jonathan@marek.ca>
Message-Id: <172891443890.1126924.247794188291241399.robh@kernel.org>
Subject: Re: [PATCH v2 0/5] x1e80100 RTC support


On Sun, 13 Oct 2024 01:15:25 -0400, Jonathan Marek wrote:
> x1e80100 needs a workaround because the RTC alarm is not owned by HLOS.
> It also needs the same offset workaround as sc8280xp/etc.
> 
> v2: remove duplicated ops and use RTC_FEATURE_ALARM instead
> 
> Jonathan Marek (5):
>   rtc: pm8xxx: implement no-alarm flag for non-HLOS owned alarm
>   dt-bindings: rtc: qcom-pm8xxx: document no-alarm flag
>   arm64: dts: qcom: x1e80100-pmics: enable RTC
>   arm64: dts: qcom: x1e80100-crd: add rtc offset to set rtc time
>   arm64: dts: qcom: x1e78100-t14s: add rtc offset to set rtc time
> 
>  .../bindings/rtc/qcom-pm8xxx-rtc.yaml         |  5 +++
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 11 +++++
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts     | 11 +++++
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi  |  8 ++--
>  drivers/rtc/rtc-pm8xxx.c                      | 43 +++++++++++++------
>  5 files changed, 59 insertions(+), 19 deletions(-)
> 
> --
> 2.45.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/x1e78100-lenovo-thinkpad-t14s.dtb qcom/x1e80100-crd.dtb' for 20241013051859.22800-1-jonathan@marek.ca:

arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: pmic@0: rtc@6100: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: rtc@6100: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/rtc/qcom-pm8xxx-rtc.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@0: rtc@6100: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: rtc@6100: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/rtc/qcom-pm8xxx-rtc.yaml#






