Return-Path: <linux-rtc+bounces-2996-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EFFA17B04
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 11:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D82D7A49C4
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 10:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9409F1E7C16;
	Tue, 21 Jan 2025 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsFfJO1e"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350A1E0DCF;
	Tue, 21 Jan 2025 10:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737454049; cv=none; b=dp3c5AkOVWD4vGS2UbS/zAohbII3TMpNC6OGQv4BDvPCi7C2dAHDKh4yUauKeiSivISRmOkNUYkwmS8Ioj18gyij+J83ZM2KQs3C6z+hQgiSe7JAgQ9or1I1Y93jkFbJ5v09udgasK0pCERKCQ8cCsmFqZvCDnAq2994NPphXx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737454049; c=relaxed/simple;
	bh=8h5oqgodori/zlYAZT+1BLm24JpkoQ/d2YWvLyyz9Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXJXK/a/7+ufSWeenl8fcYWOqlLvhTa0Pq8xJI+t4clOkkqCJLTIzwDHtvm9Z/1Q4N1W9FzOEosFK7rnKlLaGvfUcwJ9lszswoh3IayCVZeaNvBpUb5oyEFoUzinXVFtQLaEJrkdtfEWchp/VJZ185P8dHPZ8R6iwmifpTdznYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsFfJO1e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44C9C4CEDF;
	Tue, 21 Jan 2025 10:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737454048;
	bh=8h5oqgodori/zlYAZT+1BLm24JpkoQ/d2YWvLyyz9Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsFfJO1eIPsO4uxZSHpbii2fMYAg8cFzENomjYRCTu4FpP0l4QWyeafYyGTn0IWCR
	 uWMJUyk5s1YO3j9hz06V0msZ44A6VWqRiQUz4bTagk/sOiuYk6hQW6nz4h7p30z5rs
	 hE0F/IWrwdY0ntCOZdWylfXzcNU/vqLlcOvAHNo7ZcSA8J3lYpl/gL66/g46ItQvFy
	 qWFlfsoWxYt/U+fQ4V7amY2Hm5AeOXVRN+8ceoVVkqxocDisLH6EGpnPswSsyYtlGf
	 u1kh34lAElnYAtUpmGu9hLXmPtYlklDZx9tav9hqXiZCINVShlBxsm2lSNq8RO54a1
	 gZpe0mjkreAmg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1taBAS-000000008GH-34Ce;
	Tue, 21 Jan 2025 11:07:32 +0100
Date: Tue, 21 Jan 2025 11:07:32 +0100
From: Johan Hovold <johan@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: enable rtc
Message-ID: <Z49x5ElsDn3Fnovj@hovoldconsulting.com>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <CACPK8XftgBDoy1echN7VKx9Te0o37PvdqCUiJN7YGpkdK-3fJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XftgBDoy1echN7VKx9Te0o37PvdqCUiJN7YGpkdK-3fJQ@mail.gmail.com>

On Tue, Jan 21, 2025 at 02:18:21PM +1030, Joel Stanley wrote:
> On Tue, 21 Jan 2025 at 01:14, Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > This series adds support for utilising the UEFI firmware RTC offset to
> > the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> > Elite machines.
> 
> Looks good on a Surface Laptop 7 / romulus:
> 
> Tested-by: Joel Stanley <joel@jms.id.au>
> 
> [    0.407844] rtc-pm8xxx c42d000.spmi:pmic@0:rtc@6100: registered as rtc0
> [    0.407876] rtc-pm8xxx c42d000.spmi:pmic@0:rtc@6100: setting system
> clock to 2025-01-21T03:34:06 UTC (1737430446)

Thanks for testing.

Johan

