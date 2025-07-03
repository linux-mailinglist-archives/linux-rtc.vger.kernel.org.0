Return-Path: <linux-rtc+bounces-4425-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98250AF6BF4
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Jul 2025 09:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B2583A38E8
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Jul 2025 07:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DB32989B7;
	Thu,  3 Jul 2025 07:49:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3F225D6;
	Thu,  3 Jul 2025 07:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528980; cv=none; b=MHTxKbmHzssVrzPg7WK/KQHpgm/NUzzfFF18kWl2c1923PzugvrPe4BjK/qAL6bh7k0Pbf1Dd32WqfW3FwWf3KUwPQ4Dl2AR5k1ExlGvpqlX4osAnqBAwI670rCeWEvMDy3asQ0OyPjZc9NyZWmGO5i02h5Rtg+pE5bbQJXPDkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528980; c=relaxed/simple;
	bh=JAcb44Dm2Yo5eJrTvxaGRn4/w45OBGxTt8yGvkFC6Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3fLvXBUCOWqTpOsi1R8Qv4Dml2f6+6r1x9DP5uYYjyQlR2lNKQVIH3AvUpXMSjjRUuG+bwd/ymdDTbXtth2X7oI5mIgvQDrJwlp9Qa79iLZjSO9QgliqqVUpVr7JfPy1O67mgIeOFRmrySZjrZJTe84+peTNgiiDMe48hWjQs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4EFC4CEE3;
	Thu,  3 Jul 2025 07:49:39 +0000 (UTC)
Date: Thu, 3 Jul 2025 09:49:37 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev, 
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Move sophgo,cv1800b-rtc to rtc directory
Message-ID: <20250703-naughty-diligent-nightingale-d2fa9f@krzk-bin>
References: <20250608224252.3902421-1-robh@kernel.org>
 <ywln42bb3i5hyzlsmfbx3xt2kjbefqmcxytcqxdcgah77gcesi@2cdw3cgxbg4c>
 <20250617130924.GA1678432-robh@kernel.org>
 <mig7k5zyhmata6uvjwlwlompwf22qffwvma2nhjww3cmsmxnas@y2t5ukucs76q>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mig7k5zyhmata6uvjwlwlompwf22qffwvma2nhjww3cmsmxnas@y2t5ukucs76q>

On Wed, Jun 18, 2025 at 07:18:32AM +0800, Inochi Amaoto wrote:
> On Tue, Jun 17, 2025 at 08:09:24AM -0500, Rob Herring wrote:
> > On Mon, Jun 09, 2025 at 06:49:38AM +0800, Inochi Amaoto wrote:
> > > On Sun, Jun 08, 2025 at 05:42:51PM -0500, Rob Herring (Arm) wrote:
> > > > The $id path for the sophgo,cv1800b-rtc binding was missing part of the
> > > > path 'soc'. However, the correct place for RTC bindings (even if it's
> > > > also a "syscon") is the rtc directory, so move the binding there while
> > > > fixing the $id value.
> > > > 
> > > > Fixes: 76517429dbfd ("dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series")
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > >  .../bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml        | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >  rename Documentation/devicetree/bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml (96%)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > > similarity index 96%
> > > > rename from Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> > > > rename to Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > > index 5cf186c396c9..c695d2ff9fcc 100644
> > > > --- a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> > > > +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > > @@ -1,7 +1,7 @@
> > > >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > >  %YAML 1.2
> > > >  ---
> > > > -$id: http://devicetree.org/schemas/sophgo/sophgo,cv1800b-rtc.yaml#
> > > > +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800b-rtc.yaml#
> > > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > > >  
> > > >  title: Real Time Clock of the Sophgo CV1800 SoC
> > > > -- 
> > > > 2.47.2
> > > > 
> > > 
> > > As the rtc syscon has a sub function for remoteproc, is it proper to
> > > move this binding into rtc subsystem?
> > 
> > Does that affect the binding (is there more to add)? Looks like an RTC 
> > from the binding.
> > 
> 
> I think at least "resets" property may be added for the this, but I am
> not sure whether there will be more.

Just post complete bindings - see writing bindings...

Best regards,
Krzysztof


