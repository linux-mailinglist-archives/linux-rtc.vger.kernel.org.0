Return-Path: <linux-rtc+bounces-4909-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC558B57EBD
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 16:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71E223A2941
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 14:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E97530DEAD;
	Mon, 15 Sep 2025 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="VE0El93U"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22EE31C572
	for <linux-rtc@vger.kernel.org>; Mon, 15 Sep 2025 14:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946009; cv=none; b=P6K23YyPvSmzNWReTAfpcvCD2UPeYvmzcLgWFqSIWSDVQNFgdL2mIXBqIl7CCR+13HlNsUIsuuZKxkVRzND3iGfOzPWZW8sbYh81183MGPvOsJZjOFxs0HJcRgmfjPqhefuw/766We26YTZow08HjfDE15+UOUX65dwVCmw0fTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946009; c=relaxed/simple;
	bh=BPcL3Wb4WH1fDufNFQk0dtPxzJEThxned/pKKXvWxAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0yMhxi91eQ8bGtfNg53rRhFkOaqh9o7oQVhCw3bxWU4ThYNCs234LxSK0wK9PyRj8diFgnOugIyIAybfK9WxfIiWLpeEimWmUHYuQtsOTiVWJJQqr4ju6qn4k0ei2GC7PE69rXCb6L1/zHLtzHYOLnO5SM/oA2qnGhDjPDQvtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=VE0El93U; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 9B2111016286
	for <linux-rtc@vger.kernel.org>; Mon, 15 Sep 2025 19:50:01 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 9B2111016286
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1757946001; bh=BPcL3Wb4WH1fDufNFQk0dtPxzJEThxned/pKKXvWxAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VE0El93UEepO0pPA0ZcNsEMoBgjn82yIhIOz7WSa4h0YMoFNOnEWxxjs4DZ10MaQI
	 nrQ+Z7sMxxk+KVAK1aYmqEHzzhRhMHE+2yVha5O436BHMBR5GpgTP7B1ja1kAUkHTY
	 Znt6p49d3MKM63rUleCdU3/wyDniin82rtCZUIjo=
Received: (qmail 30157 invoked by uid 510); 15 Sep 2025 19:50:01 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 4.597341 secs; 15 Sep 2025 19:50:01 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 15 Sep 2025 19:49:56 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 5E85D3414E9;
	Mon, 15 Sep 2025 19:49:56 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 305D01E8134B;
	Mon, 15 Sep 2025 19:49:56 +0530 (IST)
Date: Mon, 15 Sep 2025 19:49:51 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, skhan@linuxfoundation.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com
Subject: Re: [PATCH v2 1/6] dt-bindings: rtc: Add ST m41t93
Message-ID: <20250915141951.GA3239298@bhairav-test.ee.iitb.ac.in>
References: <cover.1757510157.git.akhilesh@ee.iitb.ac.in>
 <3aed714163abc86a18a62f039b285643d9504e64.1757510157.git.akhilesh@ee.iitb.ac.in>
 <20250911-resolute-translucent-koala-1707dd@kuoka>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-resolute-translucent-koala-1707dd@kuoka>

On Thu, Sep 11, 2025 at 09:43:09AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Sep 10, 2025 at 07:22:33PM +0530, Akhilesh Patil wrote:
> > Document DT bindings for m41t93 rtc which supports time, date,
> > alarm, watchdog, square wave clock output provider, user sram
> > and 8 bit timer.
> > 
> > Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> > ---
> >  .../devicetree/bindings/rtc/st,m41t93.yaml    | 50 +++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/st,m41t93.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/st,m41t93.yaml b/Documentation/devicetree/bindings/rtc/st,m41t93.yaml
> > new file mode 100644
> > index 000000000000..bd593669cfa2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/st,m41t93.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/st,m41t93.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ST M41T93 RTC and compatible
> > +
> > +maintainers:
> > +  - linux-rtc@vger.kernel.org
> 
> Not much improved. This should be a person responsible/caring about this
> hardware support in the kernel. Why would we want to take the binding if
> no one cares about it?

Okay. As per get_maintainer.pl, linux driver corresponding to this binding does not have a dedicated
maintainer, hence it shows rtc subsystem maintainer (Alexandre Belloni).
Looking forward for your suggestion here.
What do you suggest to keep maintainer as Rob Herring or/and me ? as I see in
such cases Rob is the maintainer.

> 
> > +
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.

Sure. I will remove this. Thanks for pointing it out.

> 
> > +  ST M41T93 is spi based Real Time Clock (RTC) with time, date,
> > +  alarm, watchdog, square wave clock output, 8 bit timer and
> > +  7 bytes of user SRAM.
> 
> Best regards,
> Krzysztof

Regards,
Akhilesh


