Return-Path: <linux-rtc+bounces-2961-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC1BA16ED2
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 15:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03134169D29
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 14:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3712E1E6DCF;
	Mon, 20 Jan 2025 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODAIjziA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F0C1E5738;
	Mon, 20 Jan 2025 14:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384684; cv=none; b=jjI1Zm8BwK7I1GA76hZ7F7/J3Eh1FHZWxk5vgJ11kb+hByWvYdFInThtv7N1bydty8YH0mGQSXOt5wQO5ji7hKt7AtHyzB5c8YM9i87/OuPkvNhb6MxCC04tlXawSq6ztEbJyhQAS65AUEckOWm7cf6NebPOqzAKXsSMdBHyY8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384684; c=relaxed/simple;
	bh=Cq9uXnbecisUvPYlPRYj++5pXhuwoHDwBi8w9Ktnumk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXX8+c1FEwFcULpU/4Gsk5Lt+2uQznkm4xsUxZdLoxUBFoDAVl278ARYdYGLYo0nrTxXSF8nTqXtQs3LKn/zQEJfrs6xCqxRxIDKAqrmORW1u30jYOBz4vZv+DSSLBG5srlDDy2bSS3ZH+ZlNRckWNoNKq5bXpsUM3eBVT600es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODAIjziA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6FEC4CEDD;
	Mon, 20 Jan 2025 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737384683;
	bh=Cq9uXnbecisUvPYlPRYj++5pXhuwoHDwBi8w9Ktnumk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ODAIjziAkQ8NZFgb91Ky1bkIO3YNrM3AWcFRQgGtb2r9njL7W9vrtdiO3k7qn1Apr
	 64QX6A7YjlG0uToR4QoyvgKiyck/UElWHCTttOg4SjcN8wCZcEpWBczXUr7BpKBF6U
	 j3s2SEZ/gzh1bEHxoQI/mqHzeZnx9cEpF0gEfYBFq5CPHGyrX04GNcqDZPKqurq15/
	 cPPw6MSUoI0e4HsXvKJMEtQNi0kejTWoCSNuPh/KMcwhH/H8EB1EvsZZWOloImqAKk
	 zM2LX3NgzZBglaQakMsAum37L4IymOCkK974rRiO0jDvofrB8Sl8qenLS5mdthn6RC
	 3h9IcBTsn9Arg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tZt7f-000000003H3-1LWA;
	Mon, 20 Jan 2025 15:51:27 +0100
Date: Mon, 20 Jan 2025 15:51:27 +0100
From: Johan Hovold <johan@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Marek <jonathan@marek.ca>
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
Message-ID: <Z45i7zOsATLzCxYf@hovoldconsulting.com>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <202501122335384a545895@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501122335384a545895@mail.local>

Hi Alexandre and Jonathan,

On Mon, Jan 13, 2025 at 12:35:38AM +0100, Alexandre Belloni wrote:
> Did I miss v4 of this series?

We are still waiting for Qualcomm to provide a free and safe-to-use
allocation for the RTC offset in the PMIC.

I got tired of reminding the Qualcomm folks about this and instead
revived my patches for using the UEFI variable that the firmware (and
Windows) use for the offset.

I included Jonathan's v3 series after making the changes that we
discussed here (and a few more).

The result is here:

	https://lore.kernel.org/lkml/20250120144152.11949-1-johan+linaro@kernel.org/

and should allow us to enable the RTC on X1E today (and also avoids
running into the same SDAM allocation issue for the next platform).

> On 14/10/2024 20:47:25-0400, Jonathan Marek wrote:
> > x1e80100 needs a workaround because the RTC alarm is not owned by HLOS.
> > It also needs the same offset workaround as sc8280xp/etc.
> > 
> > v2: remove duplicated ops and use RTC_FEATURE_ALARM instead
> > v3:
> >  - renamed flag to qcom,no-alarm
> >  - don't remove alarm registers/interrupt from dts
> > 
> > Jonathan Marek (5):
> >   rtc: pm8xxx: implement qcom,no-alarm flag for non-HLOS owned alarm
> >   dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
> >   arm64: dts: qcom: x1e80100-pmics: enable RTC
> >   arm64: dts: qcom: x1e80100-crd: add rtc offset to set rtc time
> >   arm64: dts: qcom: x1e78100-t14s: add rtc offset to set rtc time

Johan

