Return-Path: <linux-rtc+bounces-4994-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABF5B8CAA5
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 16:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB18F3B92A8
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 14:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD1C213237;
	Sat, 20 Sep 2025 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="JrpO2igs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A939D18BC3B
	for <linux-rtc@vger.kernel.org>; Sat, 20 Sep 2025 14:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758379668; cv=none; b=MGMXxmr8NVl0sCek9waPjQkXYVfKHgoY9/eI0cEaOe7YMp4sczaDtydaWOiPFwIEJ1ahV4x9RFSvy8qY68MV6oJ76ISq/MehXGKQApd464G+MrhwI0Piyvxp0K7jBSxl4kve6HjjHhpm0ccV0RHqYxoqJgrSPUAx8N3cS7rDLFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758379668; c=relaxed/simple;
	bh=789DFs4LQtmBntaur0VPctHDw1awAzUu8jfoedb8OpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5D4B45RRAtfFhPH+lbTLHPTNfcbCUA8wCGNN2OtyCcUXvUJLodipZMLuhU7A/A5yRgw9rhg8U6Ry6T0ybCYynSYb17rnyXHrok6PPJ99k7I1hZ/12cO9DGSURY4BfvCqk5GlBRLGP462lfw/60/w+RCp/tb77nYO8qBHsA45uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=JrpO2igs; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 92E54104CBA6
	for <linux-rtc@vger.kernel.org>; Sat, 20 Sep 2025 20:17:39 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 92E54104CBA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1758379659; bh=789DFs4LQtmBntaur0VPctHDw1awAzUu8jfoedb8OpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JrpO2igsc7Y9T+uQg3mG7dnzHTOB5ipGql9wQppg6TWtNQvwj+lJhRG1e/ZRFUTAc
	 kQknJ9dqRNDXjI1VM8neeof97UoG7BYOTplpqwnqmVQcL3r+EkucYQlXFtcvtcB2Cv
	 LEVY4UfCNwbnsHcQQWvoXrX5JaY5ip/DNqlrCZlg=
Received: (qmail 8143 invoked by uid 510); 20 Sep 2025 20:17:39 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 5.520536 secs; 20 Sep 2025 20:17:39 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 20 Sep 2025 20:17:33 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id 66BDA36003F;
	Sat, 20 Sep 2025 20:17:33 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 3C61E1E814BD;
	Sat, 20 Sep 2025 20:17:33 +0530 (IST)
Date: Sat, 20 Sep 2025 20:17:28 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, skhan@linuxfoundation.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com
Subject: Re: [PATCH v2 1/6] dt-bindings: rtc: Add ST m41t93
Message-ID: <20250920144728.GA69280@bhairav-test.ee.iitb.ac.in>
References: <cover.1757510157.git.akhilesh@ee.iitb.ac.in>
 <3aed714163abc86a18a62f039b285643d9504e64.1757510157.git.akhilesh@ee.iitb.ac.in>
 <20250911-resolute-translucent-koala-1707dd@kuoka>
 <20250915141951.GA3239298@bhairav-test.ee.iitb.ac.in>
 <85a46710-64ee-4a21-b95c-d4c18c2f634f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85a46710-64ee-4a21-b95c-d4c18c2f634f@kernel.org>

On Wed, Sep 17, 2025 at 09:52:24AM +0900, Krzysztof Kozlowski wrote:
> On 15/09/2025 16:19, Akhilesh Patil wrote:
> >>> +$id: http://devicetree.org/schemas/rtc/st,m41t93.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: ST M41T93 RTC and compatible
> >>> +
> >>> +maintainers:
> >>> +  - linux-rtc@vger.kernel.org
> >>
> >> Not much improved. This should be a person responsible/caring about this
> >> hardware support in the kernel. Why would we want to take the binding if
> >> no one cares about it?
> > 
> > Okay. As per get_maintainer.pl, linux driver corresponding to this binding does not have a dedicated
> > maintainer, hence it shows rtc subsystem maintainer (Alexandre Belloni).
> 
> And what did I express at v1?
> 
> > Looking forward for your suggestion here.
> > What do you suggest to keep maintainer as Rob Herring or/and me ? as I see in
> > such cases Rob is the maintainer.
> 
> No, I really doubt Rob cares about this particular hardware. Neither do
> I, nor Conor.

okay.
I have this rtc hardware with me and I am willing to own and maintain
this support in the kernel.
Hence I will add myself as a maintainer for this binding and share v3.

Regards,
Akhilesh

> 
> 
> Best regards,
> Krzysztof

