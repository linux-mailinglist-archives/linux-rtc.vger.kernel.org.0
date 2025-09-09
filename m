Return-Path: <linux-rtc+bounces-4848-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA64B4ACA1
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Sep 2025 13:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B59A170529
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Sep 2025 11:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216703314C1;
	Tue,  9 Sep 2025 11:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="n5MxqwKS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98430326D62
	for <linux-rtc@vger.kernel.org>; Tue,  9 Sep 2025 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757418270; cv=none; b=k2SsGgzl6yFEFuwmFcujMNEor3GD2TJZfEx/dLBY1JJfccaAtgnIk941Tb2s2DyRR++yPgR2GSF7B8d5w5mR+3Po9ByD27tui+ZMVRmVyGcbsUrMSi6NDUt1UneoRlx69YElFFKOKvrIc/8Z3MwXxIrJZcwLLGBJPzsYWfeMgY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757418270; c=relaxed/simple;
	bh=Plv+TqDFQzCl2SwwnJurnJxS/oJj+NUjYOYCMKqmMW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNy6mVSIGXpFbUf/OizV/bkrpj9jDKh4E1TOz0eTIPolPrklC34eUalENt5nrjfsvNmNfKURBuv+DLGjJJ6ppTfcNZ6KE23t4o6ndi6Ao0zv19uz+iictHfJJlMlMuoiLtoWMaamWBS5lWlVOrPKQ2KuJ/qspwfwi+wuqCRl7F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=n5MxqwKS; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 7CD3E101192C
	for <linux-rtc@vger.kernel.org>; Tue,  9 Sep 2025 17:14:14 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 7CD3E101192C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1757418254; bh=Plv+TqDFQzCl2SwwnJurnJxS/oJj+NUjYOYCMKqmMW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n5MxqwKSW5ntnYjmkB/eUkHEuo4R8JxYJkPFO1i8GvjAKUIXrg4Mlhq6+t9rycIfa
	 sKIVPbamgLHFBCVBfi8z0bZJoRmQj1oVWzciihwqLIeva+tFtFC+OYSBmK8XDdgTx3
	 u7GmKq7e158dv59qnwryGpGpsXIk0OPvfdfKyz6Q=
Received: (qmail 26567 invoked by uid 510); 9 Sep 2025 17:14:14 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 5.542875 secs; 09 Sep 2025 17:14:14 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 9 Sep 2025 17:14:08 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 46C473414E8;
	Tue,  9 Sep 2025 17:14:08 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 939C41E8138A;
	Tue,  9 Sep 2025 17:14:05 +0530 (IST)
Date: Tue, 9 Sep 2025 17:14:00 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, skhan@linuxfoundation.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com
Subject: Re: [PATCH 2/7] dt-bindings: rtc: add bindings for m41t93
Message-ID: <20250909114400.GA2065465@bhairav-test.ee.iitb.ac.in>
References: <cover.1756908788.git.akhilesh@ee.iitb.ac.in>
 <40c91cbb07140ecdf4f91afc118c2518e85041c3.1756908788.git.akhilesh@ee.iitb.ac.in>
 <9094d792-c20a-48fa-b769-5824e1f451eb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9094d792-c20a-48fa-b769-5824e1f451eb@kernel.org>

On Wed, Sep 03, 2025 at 04:30:53PM +0200, Krzysztof Kozlowski wrote:
> On 03/09/2025 16:25, Akhilesh Patil wrote:
> > add DT bindings for m41t93 rtc in YAML format.
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> 
> Please organize the patch documenting compatible (DT bindings) before
> their user.
> See also:
> https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46
> 

Hi Krzysztof, Thanks for the review and pointng out to these resources.
I will fix those as per the guidelines and share v2 of the series.

> > 
> > Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> > ---
> >  .../devicetree/bindings/rtc/st,m41t93.yaml    | 43 +++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/st,m41t93.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/st,m41t93.yaml b/Documentation/devicetree/bindings/rtc/st,m41t93.yaml
> > new file mode 100644
> > index 000000000000..03673adc79db
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/st,m41t93.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/st,m41t93.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ST M41T93 RTC and compatible
> > +
> > +maintainers:
> > +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> This should not be subsystem maintainer.

okay.

> 
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - st,m41t93
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#clock-cells":
> 
> Hm? Are you sure? Nothing in the driver nor commit msg suggests that.

This RTC chip has square wave output generation which can generate
clocks from 1Hz to 32KHz. Hence, this device can be clock provider and
other devices can be clock consumer via DT.
I will add this in the description.

> 
> > +    const: 1
> > +
> > +allOf:
> > +  - $ref: rtc.yaml
> > +
> > +unevaluatedProperties: false
> 
> This goes after required. See example schema.

sure.

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    spi {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      rtc@0 {
> > +        spi-max-frequency = <2000000>;
> 
> Does not look tested.

Will run $ make dt_binding_check , retest on my board and add actual
node I test as an example here.

> 
> > +        compatible = "st,m41t93";
> > +        reg = <0>;
> 
> Please follow DTS coding style. Which property is the first in the
> coding style?

sure, will fix in v2 as much as understand referring resources you
shared and your DTS 101 talk from OSS 25 Europe.
Still, if I miss something do let me know on v2 series. 

Regards,
Akhilesh

> 
> Best regards,
> Krzysztof

