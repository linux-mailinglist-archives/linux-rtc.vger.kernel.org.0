Return-Path: <linux-rtc+bounces-2964-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0787BA16F22
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 16:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC4C61888CBD
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 15:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4071E32DB;
	Mon, 20 Jan 2025 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4lq8/HY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204E018FDC8;
	Mon, 20 Jan 2025 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737386253; cv=none; b=q7C6dzUhe8QvmOqxeu4zCEAJijfh1NcJARLmiPHzvXELO9Pfc+pzryMdSsl/fnH6p1ZWvTqAKpPh9v92rS8cKYbjarkaT9NuBotshoihYWTNCX10r/J2377TJEUK/bZ1ze/k0Sot4LW6B4qAF4YX2RD1vNKBwyCPXfzwFrE8fGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737386253; c=relaxed/simple;
	bh=HZMNfWTZPnN1KQ8nLBLhGEDanVv6XjwOC5LlgLKCv6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E84ivlCgnBLVFDpcZYkKsEHBUINw0V35QiwhWVUSmz5ziaasZRz+cCuNN7g7esjgsJWXkLEM3xonxtfn6QJUoVCeJV253QW+6ZaoR70WqCbT3+VXKuy2tYhijXprJl+MebxFV1qUeGlMRbS0cQUDFp99olyf7svtLiv3GBfIlYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4lq8/HY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DCF4C4CEDD;
	Mon, 20 Jan 2025 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737386252;
	bh=HZMNfWTZPnN1KQ8nLBLhGEDanVv6XjwOC5LlgLKCv6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4lq8/HY+rGv7+qPMgcHBBEx/SfsNwkAlsOhi4WP9hc/Gh+X59C+ReavK+3JjllEb
	 G2+Fvaqh9PtOhL4Gt+NkwsF9ciV9YZUhVyEJ5/wJiFzgOJZw+mPmrx4LqlyguClOVf
	 /r8/XRxQHGtZvqKbIiCHJtY5UDGRjuK6oeUCObqveMP5qJ58vxSP7cRsUNSihnscO7
	 i16Sxrf8l8Uw/M4t9MVEbaR4Qs8alulh1CbdF+8nL+uhEmPb9ZDEFCy+Gqc/LAXHpZ
	 KBXMWaY/RmLwi63ZlKYE6bMkK6onDckF/mZ6d7dqi7zcs+YZ/4P+YZA1fIToZ/B6jX
	 xr9QfLUzlDTrQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tZtWy-000000003jz-1QRP;
	Mon, 20 Jan 2025 16:17:36 +0100
Date: Mon, 20 Jan 2025 16:17:36 +0100
From: Johan Hovold <johan@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
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
Subject: Re: [PATCH 3/7] rtc: pm8xxx: add support for uefi offset
Message-ID: <Z45pEEofHiQRkR0D@hovoldconsulting.com>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-4-johan+linaro@kernel.org>
 <Z45nYEfq2IPsrRy7@bogus>
 <Z45oqqnlMSNEYyil@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z45oqqnlMSNEYyil@hovoldconsulting.com>

On Mon, Jan 20, 2025 at 04:15:54PM +0100, Johan Hovold wrote:
> On Mon, Jan 20, 2025 at 03:10:24PM +0000, Sudeep Holla wrote:
> > On Mon, Jan 20, 2025 at 03:41:48PM +0100, Johan Hovold wrote:
> > > On many Qualcomm platforms the PMIC RTC control and time registers are
> > > read-only so that the RTC time can not be updated. Instead an offset
> > > needs be stored in some machine-specific non-volatile memory, which the
> > > driver can take into account.
> > > 
> > > Add support for storing a 32-bit offset from the GPS time epoch in a
> > > UEFI variable so that the RTC time can be set on such platforms.
> > >
> > 
> > Why can't the UEFI runtime services be used here ?
> > In short, why is drivers/rtc/rtc-efi.c not working or no attempts are
> > made to check if that works just fine ?
> 
> As I alluded to in the commit message, the Qualcomm UEFI implementation

s/commit message/cover letter/

> is broken and the runtime services cannot be accessed during runtime...
> 
> That's why we can't use rtc-efi and why we have a dedicated efivars
> implementation that talks directly to the firmware using a custom
> protocol:
> 
> 	https://lore.kernel.org/all/20220723224949.1089973-1-luzmaximilian@gmail.com/

Johan

