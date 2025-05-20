Return-Path: <linux-rtc+bounces-4119-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA84BABD0A3
	for <lists+linux-rtc@lfdr.de>; Tue, 20 May 2025 09:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06A7B1B671B6
	for <lists+linux-rtc@lfdr.de>; Tue, 20 May 2025 07:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259BB25DAF9;
	Tue, 20 May 2025 07:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMDhK0o0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B820E32B;
	Tue, 20 May 2025 07:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747726872; cv=none; b=Ey8JS/Cu1G7kGnykWMAvHatC2rd9nvyAS90cSmmtBXEZS7hN6cWZ6r6t8iY4BJMRSMR4xboaYHLlk33Nc3NLRs36/dXrIJvd2HioPl1M8ZLR3SaeYE9p5jajW3blWyDtDe5cp5FyeYBBEZnxQu3kTYt5NYdf0au9Ey2AwcJwbHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747726872; c=relaxed/simple;
	bh=cRRPFwxj9fwEYbXrKPBQ8+y/AY7gnH+o6jx9SKRqHfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3RTkVHtYL0tlyKjvggiPQswdOGSktGwvZHscppphOrM0tka5tp4bgH1Bq9TrKAfgY6ntdfqiZkBCLsMaPSL5MFFBoNPYOyJPR4FkUwby2KaG5wN6RFRwz07fVeMHv61ItLPaXi2wjnNculIjI0nQL0flsVnlqS2QXGGH5tc3mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMDhK0o0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A736C4CEE9;
	Tue, 20 May 2025 07:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747726871;
	bh=cRRPFwxj9fwEYbXrKPBQ8+y/AY7gnH+o6jx9SKRqHfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMDhK0o0668Mj8E9mjpCXB42jQjXNeoq3iVbUNSH/eGw2+9A6XQzcCr90CtSGGbHO
	 f2G+z5IPgCDq9YmyQell4uio47Klj98S3eFIeHYcTWCLWae31EGYOKWP0qmpA8F0Nd
	 CRaGDXMBAmT234O9zuhtWUEhKAbHwn78/FqMopopWuMySqZYWuwq0YxD6ACtWjsn4b
	 JGhCsPW71kloc/u8XqSb+3YhDe7dmVoYZpbNTu3E6TmwSkE2ICMF8Ja7NC5l4hknRc
	 5LPAH10o7maHNgR6LauUgd7BujCRP5OjUcCeAo5GdMjeZDWf/BEf3+7O1DienfJlg6
	 UZLg3jUesyjWQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uHHb0-0000000014r-2g5p;
	Tue, 20 May 2025 09:41:07 +0200
Date: Tue, 20 May 2025 09:41:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 0/4] rtc: pm8xxx: fix uefi offset lookup
Message-ID: <aCwyElMgSqcCK7Re@hovoldconsulting.com>
References: <20250423075143.11157-1-johan+linaro@kernel.org>
 <aBsRxbBb91e_sQn3@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBsRxbBb91e_sQn3@hovoldconsulting.com>

Hi Alexandre,

On Wed, May 07, 2025 at 09:54:46AM +0200, Johan Hovold wrote:
> Hi Alexandre and Bjorn,
> 
> On Wed, Apr 23, 2025 at 09:51:39AM +0200, Johan Hovold wrote:

> > This series adds a 'qcom,uefi-rtc-info' boolean DT property to indicate
> > that the RTC offset is stored in a Qualcomm specific UEFI variable so
> > that the OS can determine whether to wait for it to become available.
> > 
> > I used such a property in v1 of the series adding support for the UEFI
> > offset [1], but mistakenly convinced myself that it was not needed given
> > that the efivars driver would need to remain built in. As Rob Clark
> > noticed, this is however not sufficient and the driver can currently
> > fail to look up the offset if the RTC driver is built in or if a
> > dependency of the efivars driver is built as a module. [2]

> > Preferably the binding and driver fix can be merged for 6.15-rc by
> > Alexandre, while Bjorn takes the DT changes through the branch which has
> > the DT patches from v2 (which unfortunately missed 6.15 but may possibly
> > be sent as hw enablement fixups). [3]
> 
> It seems we won't have RTC support in 6.15, but could you please pick
> these up for 6.16 to make sure that the RTC works also when the driver
> is built in?

It's only been two weeks since my last last reminder about this series,
but can you please pick up the binding and driver patches for 6.16?

Bjorn has already sent his DT changes for 6.16, but since these are
fixes he should be able to get them in during the 6.16 cycle.

It would help a lot if the driver changes are in place then.

> > [1] https://lore.kernel.org/all/20250120144152.11949-1-johan+linaro@kernel.org/
> > [2] https://lore.kernel.org/all/aAecIkgmTTlThKEZ@hovoldconsulting.com/
> > [3] https://lore.kernel.org/lkml/20250219134118.31017-1-johan+linaro@kernel.org/
> > 
> > Johan Hovold (4):
> >   dt-bindings: rtc: qcom-pm8xxx: add uefi-variable offset
> >   rtc: pm8xxx: fix uefi offset lookup
> >   arm64: dts: qcom: sc8280xp-x13s: describe uefi rtc offset
> >   arm64: dts: qcom: x1e80100: describe uefi rtc offset

Johan

