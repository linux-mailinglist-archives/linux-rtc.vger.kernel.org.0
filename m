Return-Path: <linux-rtc+bounces-2452-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3CB9BB901
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 16:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F25D282CA3
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 15:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B541B9835;
	Mon,  4 Nov 2024 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kacN7HFe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF8229CE6;
	Mon,  4 Nov 2024 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730734275; cv=none; b=UHiHmPznwkfDFa2M0PaimSsC+jbMopuVNdXmh0IBYgByb1M8Oc4bozqSXYbfC6YEIq0B/tlDZjU1VdTWM5EwPO/SAgL+wIEHOd493rq9/9Vd3Q1q09qpHeeDNtMlZXUxZQfCMmcAbzowe46gGl0V662xCe5hyUcLmFJYYQEED9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730734275; c=relaxed/simple;
	bh=3Fy1jOsQOnUvBVYuqqqVwd9tb0/m9bzjV5s/aymLShs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meCIQcZN9zy4RtgSMdBvBW6zMh5ARbqrGKSJxK39k0cSD/O0G5IogRD/FHhLdv6xDjeMY8T8fSdwxfRKEyof9UulyX960XXRN/qGsEtGnv57SQG6ga/5pvdu7vi/eDTxZwZlzmae+Fd5qXQoTPL9cYy6JBAubmuwiKl2V2v/YTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kacN7HFe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB60CC4CECE;
	Mon,  4 Nov 2024 15:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730734275;
	bh=3Fy1jOsQOnUvBVYuqqqVwd9tb0/m9bzjV5s/aymLShs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kacN7HFey8Z9quF31vtpdKNqCWiQEPm2so2YOGa87PVujVygueSqvAyOSA/3jlJcj
	 qrQLwuOMb8lpDvHKU08OSFiCNmCF8MiRwqoZckD1QY1Fvuv0mhaKSFDw0TivYfe8L/
	 E0+YAoD1lM5YrMYeViXrHz5S/ZYblKc+2E/q8OoWKStrjivH8H/GXqvPBR1bLqxSfs
	 cPEuLAZdYZbnRi0EZcCVd3ErfIGKlo5H5BAS2mi7Q4ZPAAQwWJvk3gAywxvrZVWkwY
	 7oAUms39P3WCDVujJSWoLv4tCFNuIYCTF5x93rI2mDM9jjXkTT6fU4JVt7u6FmviZe
	 6qP6OVQOL+1YA==
Date: Mon, 4 Nov 2024 09:31:13 -0600
From: Rob Herring <robh@kernel.org>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Frank Li <Frank.li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	IMX Review List <imx@lists.linux.dev>
Subject: Re: [PATCH v3 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <20241104153113.GA111159-robh@kernel.org>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
 <20241031083557.2156751-2-ciprianmarian.costea@oss.nxp.com>
 <ZyOyvgw0qZ4YKwTi@lizhi-Precision-Tower-5810>
 <4b82e393-093f-4477-bf0f-ee559a3b97c1@oss.nxp.com>
 <ZyUWhLdODsNk7KTe@lizhi-Precision-Tower-5810>
 <0e3edc61-02c0-40cf-883f-9b8cd6019c49@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e3edc61-02c0-40cf-883f-9b8cd6019c49@oss.nxp.com>

On Mon, Nov 04, 2024 at 10:22:05AM +0200, Ciprian Marian Costea wrote:
> On 11/1/2024 7:57 PM, Frank Li wrote:
> > On Fri, Nov 01, 2024 at 11:29:24AM +0200, Ciprian Marian Costea wrote:
> > > On 10/31/2024 6:39 PM, Frank Li wrote:
> > > 
> > > Hello Frank,
> > > 
> > > Thank you for your review!
> > > 
> > > > On Thu, Oct 31, 2024 at 10:35:54AM +0200, Ciprian Costea wrote:
> > > > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > > > 
> > > > > This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
> > > > > 
> > > > > Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > > > Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > > > Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > > > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > > > ---
> > > > 
> > > > next time you can cc imx@lists.linux.dev
> > > 
> > > Thanks for your suggestion, I will start adding this list.
> > > 
> > > > 
> > > > >    .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 99 +++++++++++++++++++
> > > > >    1 file changed, 99 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..3694af883dc7
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > > > @@ -0,0 +1,99 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: NXP S32G2/S32G3 Real Time Clock (RTC)
> > > > > +
> > > > > +maintainers:
> > > > > +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > > > +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    oneOf:
> > > > > +      - enum:
> > > > > +          - nxp,s32g2-rtc
> > > > > +      - items:
> > > > > +          - const: nxp,s32g3-rtc
> > > > > +          - const: nxp,s32g2-rtc
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  "#clock-cells":
> > > > > +    const: 1
> > > > 
> > > > Does your RTC is clock provider? why need #clock-cells
> > > > 
> > > 
> > > RTC clocking on S32G2/S32G3 has a clock mux for selecting between up to 4
> > > different clock sources (parents).
> > > Now, as suggested in previous reviews, I've switched to using the CCF in
> > > order to implement this hardware particularity. In the end I've resorted to
> > > implementing 'assigned-*' approach which while not mandatory as per proposed
> > > bindings I find it quite scalable in selecting clock sources for the RTC
> > > module compared to the first iteration (V1) of this patchset.
> > 
> > Any link of previous review?
> > 
> > Frank
> > 
> 
> Please consider the following related reviews:
> 
> [1] https://lore.kernel.org/all/202409121403232ab1295b@mail.local/
> [2]
> https://lore.kernel.org/all/6659aa90-53c5-4a91-a9f9-01120c88f107@oss.nxp.com/
> [3] https://lore.kernel.org/all/20241016160823c22ccb22@mail.local/

I've replied on the prior version.

Rob

