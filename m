Return-Path: <linux-rtc+bounces-4304-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7182FADCCE4
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Jun 2025 15:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A52133BA9DB
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Jun 2025 13:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA51A2E9733;
	Tue, 17 Jun 2025 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcXSTeBH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E092E716B;
	Tue, 17 Jun 2025 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165769; cv=none; b=tvR6iXo8LpVuKRi53L0X4QYGCu6S7oejWetlDRefZ/Z1CfJy1Q007S+HwLy5a5+TPqrACE20pOBYdE0g6XJGNzJC2TfzH5TlBaBrcUjMXVWcBiV94vQUZ8L1WIop2d1WxZeJoI/hwxSrKWpe73y+i4KNnwU6YjTJ1kRyIfFTWow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165769; c=relaxed/simple;
	bh=HvGY6oce5rUZfv/fTGrMAeDcKLN52b/tg7Nr1pAVykk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iocI1XSEOHyBaUkIc2Q0To75FvM7mwhmSznAPCoAsUbYHFaVcpEr6MP0w9SjQGhB6pd8+764De3lLVFY4Pie6cpJC0lQjtgJdHF3aiznWp4H0vVmmYqzCnYtqqCHhylxdLuQ+pGVU0sv1RtXrQfwmi4EKMA+WjcPDlzASPIsZc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcXSTeBH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D046C4CEE3;
	Tue, 17 Jun 2025 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750165769;
	bh=HvGY6oce5rUZfv/fTGrMAeDcKLN52b/tg7Nr1pAVykk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcXSTeBHsqWdmxhqwnrQnxGYBo33tJMLPLnh4ac3nUmRVLuZoj3aOHF9p/NbUw8ly
	 F1Zj31U3KrWkLHatgLRu2bNuoRsWY/HpwV3gJ3zVsnOoZ3B1fPcVWuk3Vwt1yseCyJ
	 GjIwN0z6BBSnRSzVYV/FL0jE3iQuHyiGkH8B3LQ715vd+vHSjMoIPPvf1k4nrLGOzh
	 Ipz3prrnlSsQN6vcQMCPoZ0IoYTnm78XxepwPH/yy1sWdr+QfVN5FuZ8670VQfDjmM
	 9VMVFQDcVkYEr5j7FYhuTUTSsolMIzoS2W5IfMQLVpFkr78zeKm01m2CPlle3DompZ
	 g64GzwOAQ6i2w==
Date: Tue, 17 Jun 2025 08:09:24 -0500
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Move sophgo,cv1800b-rtc to rtc directory
Message-ID: <20250617130924.GA1678432-robh@kernel.org>
References: <20250608224252.3902421-1-robh@kernel.org>
 <ywln42bb3i5hyzlsmfbx3xt2kjbefqmcxytcqxdcgah77gcesi@2cdw3cgxbg4c>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ywln42bb3i5hyzlsmfbx3xt2kjbefqmcxytcqxdcgah77gcesi@2cdw3cgxbg4c>

On Mon, Jun 09, 2025 at 06:49:38AM +0800, Inochi Amaoto wrote:
> On Sun, Jun 08, 2025 at 05:42:51PM -0500, Rob Herring (Arm) wrote:
> > The $id path for the sophgo,cv1800b-rtc binding was missing part of the
> > path 'soc'. However, the correct place for RTC bindings (even if it's
> > also a "syscon") is the rtc directory, so move the binding there while
> > fixing the $id value.
> > 
> > Fixes: 76517429dbfd ("dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series")
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml        | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename Documentation/devicetree/bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml (96%)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > similarity index 96%
> > rename from Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> > rename to Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > index 5cf186c396c9..c695d2ff9fcc 100644
> > --- a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  %YAML 1.2
> >  ---
> > -$id: http://devicetree.org/schemas/sophgo/sophgo,cv1800b-rtc.yaml#
> > +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800b-rtc.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> >  title: Real Time Clock of the Sophgo CV1800 SoC
> > -- 
> > 2.47.2
> > 
> 
> As the rtc syscon has a sub function for remoteproc, is it proper to
> move this binding into rtc subsystem?

Does that affect the binding (is there more to add)? Looks like an RTC 
from the binding.

Rob

