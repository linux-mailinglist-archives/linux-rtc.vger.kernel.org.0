Return-Path: <linux-rtc+bounces-4056-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8953CAAD92B
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 09:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B02C918832BA
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 07:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84263221FC3;
	Wed,  7 May 2025 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYPP9URb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556BB2153E2;
	Wed,  7 May 2025 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604491; cv=none; b=K6YjMxA02J33TdBA2eoAyWGQbgfrg+g3HWf1qFuovOzeY9QhUnc9hs6NrlZVFrKcaQtvA//6ljbKLB3s9N0ePob1J+bUZXMkDReQnS9vXvaWYhljV2SZvEpYL3sPY3Yb2ZoMkL4iqahsWmsQixRuCxLfHqiS3scn7sn/SgClaY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604491; c=relaxed/simple;
	bh=RvNzjk0M4mARQxnDPb6DusUcGQ12+LWoRjehzoQ9+0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTt0wQZxRvNNyKdy1UniHEVVsO6O3zn+uevFoUM0ekRSczZexXdi/3PmaKrS1fJKeQiYiFJn0xy0aDHs94gKkt8wP1erT+t0Z0uq15HAm6sA0f8ABAVPnlrFhsk8oVLEbbizH2x/onFQPvTdBvXxPmUZxDg7BSyAu+oGFZGa4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYPP9URb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4CCC4CEEE;
	Wed,  7 May 2025 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746604490;
	bh=RvNzjk0M4mARQxnDPb6DusUcGQ12+LWoRjehzoQ9+0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYPP9URbYPC+uecaNokMl21TG6IAS8eM6KFsa+k+ziuulMc/0YPMlkBc/6xBJ7oVX
	 2sQc4TQbzH7QDarjCEITyBG5jt1yqyaImSlsaKopA5Ul9y6gl7ntQDYkdF/OMJq/eZ
	 kcjgqeqTVApPxZQCQY1RKJMpbKdbifLFwlJZCq7HdvKw5Ci8B7CgwwuaY8OShZ6qQO
	 t2K2mNgsjVtjpg6IDPp96LiaJzpC77DdRBjlOT/r/u90RgstR6oTLYKWQ9E2sRro0P
	 J6jgmSDJLGUEw063QNzeMCOyg7S82M48kvrZ+TUB/UGNhgUYDZqH9IJh2WreR5lg9c
	 V4m6pM62CzCIg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uCZc5-000000005me-3rfW;
	Wed, 07 May 2025 09:54:46 +0200
Date: Wed, 7 May 2025 09:54:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] rtc: pm8xxx: fix uefi offset lookup
Message-ID: <aBsRxbBb91e_sQn3@hovoldconsulting.com>
References: <20250423075143.11157-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423075143.11157-1-johan+linaro@kernel.org>

Hi Alexandre and Bjorn,

On Wed, Apr 23, 2025 at 09:51:39AM +0200, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
> 
> On platforms where the offset is stored in a Qualcomm specific UEFI
> variable the variables are also accessed in a non-standard way, which
> means that the OS cannot assume that the variable service is available
> by the time the driver probes.
> 
> This series adds a 'qcom,uefi-rtc-info' boolean DT property to indicate
> that the RTC offset is stored in a Qualcomm specific UEFI variable so
> that the OS can determine whether to wait for it to become available.
> 
> I used such a property in v1 of the series adding support for the UEFI
> offset [1], but mistakenly convinced myself that it was not needed given
> that the efivars driver would need to remain built in. As Rob Clark
> noticed, this is however not sufficient and the driver can currently
> fail to look up the offset if the RTC driver is built in or if a
> dependency of the efivars driver is built as a module. [2]
> 
> As with the rest of this driver, hopefully all of this goes away (for
> future platforms) once Qualcomm fix their UEFI implementation so that
> the time service can be used directly.
> 
> Preferably the binding and driver fix can be merged for 6.15-rc by
> Alexandre, while Bjorn takes the DT changes through the branch which has
> the DT patches from v2 (which unfortunately missed 6.15 but may possibly
> be sent as hw enablement fixups). [3]

It seems we won't have RTC support in 6.15, but could you please pick
these up for 6.16 to make sure that the RTC works also when the driver
is built in?

> [1] https://lore.kernel.org/all/20250120144152.11949-1-johan+linaro@kernel.org/
> [2] https://lore.kernel.org/all/aAecIkgmTTlThKEZ@hovoldconsulting.com/
> [3] https://lore.kernel.org/lkml/20250219134118.31017-1-johan+linaro@kernel.org/
> 
> Johan Hovold (4):
>   dt-bindings: rtc: qcom-pm8xxx: add uefi-variable offset
>   rtc: pm8xxx: fix uefi offset lookup
>   arm64: dts: qcom: sc8280xp-x13s: describe uefi rtc offset
>   arm64: dts: qcom: x1e80100: describe uefi rtc offset

Johan

