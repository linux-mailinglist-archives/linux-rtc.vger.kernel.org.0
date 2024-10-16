Return-Path: <linux-rtc+bounces-2210-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D79A01B4
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 08:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD17E28A102
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 06:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369D4192582;
	Wed, 16 Oct 2024 06:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7W8i7lq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864D18C32E;
	Wed, 16 Oct 2024 06:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729061213; cv=none; b=iuvonM8vrVJ2vUPUYT4c23uogDyjhmN++4CYwv/9odaGWthSxF4TRrUdzw402hNqma/KJ6OVklpEvekC0u8aQ8Y1txlXECZ58VuaGsg4C1N/FcSgUTjNZHe/lUhj/kJt4EElD8mrXlwLlIo+7GAla2P0Wtf/Zs9aIYLICH0cYGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729061213; c=relaxed/simple;
	bh=LhhWC4uC9QB7LvY8dRYyCu3Pa/978BzoqrmHiVLvubI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exdD7YLPFIbpYYI2szzo2mfoeuw0Xxf+SoiSCvcEDBOjVr4j3KK/W5pLWCzvjP/v9zvuvGzr2UC4O37Oarkg5iTrG6RWV8TUw1VS3YRHBXaBLUMsVRr+arbQkBbHNSPoEDw1XpL9/Qfv5gojO5yIex7IzX/uUmZxTuS67XtzYKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7W8i7lq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9163AC4CEC5;
	Wed, 16 Oct 2024 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729061212;
	bh=LhhWC4uC9QB7LvY8dRYyCu3Pa/978BzoqrmHiVLvubI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7W8i7lqmeLc+eutLnFZPrARTvu050odiI/x0RRvQZvYLZxKyf8SRyHgmBGiy1Qso
	 ZHd2JyN8woka69FlqSRwbY0u1n8Gj4b88LOw+daIcu6INplXgLbgdwzfkicbzz2OA0
	 zJdvXveC1N0EzUZzfUuOBgMok6MdMyqm6y5Ee/ClIWDP808Q5J/6GUmXIg34Cg3eXG
	 yc6UjRDCAZsTL3ihqGxCkB4IpYJAEf2V7DRE+CCigtXipbjmeLnQlxYXUw0i2pJ7XP
	 Go5aSqA8cWpvwU2fgf6I1z3nGxNsgK03LCfFijUFR4wwvSx6P+8pff2WJPcbJxWRdm
	 D/Oqa03yyz3Vw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0xoB-000000004sC-0eKw;
	Wed, 16 Oct 2024 08:46:59 +0200
Date: Wed, 16 Oct 2024 08:46:59 +0200
From: Johan Hovold <johan@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: rtc: qcom-pm8xxx: document
 qcom,no-alarm flag
Message-ID: <Zw9hY-v6s0SXyjri@hovoldconsulting.com>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <20241015004945.3676-3-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015004945.3676-3-jonathan@marek.ca>

On Mon, Oct 14, 2024 at 08:47:27PM -0400, Jonathan Marek wrote:
> Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
> Thus writing to RTC alarm registers and receiving alarm interrupts is not
> possible.
> 
> Add a qcom,no-alarm flag to support RTC on this platform.

Could dropping the alarm interrupt be an alternative to another vendor
property? Some existing RTC drivers use this.

It also seems like having a dedicated compatible for this platform is
warranted, and would also suffice to determine when the alarm registers
are writable.

Note that the binding update should go before the driver patch in the
series.

Johan

