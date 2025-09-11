Return-Path: <linux-rtc+bounces-4859-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6713B52A4D
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 09:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E637D1BC0456
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 07:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D9E27F4E7;
	Thu, 11 Sep 2025 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEqtKTBZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9C427E05E;
	Thu, 11 Sep 2025 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757576592; cv=none; b=Hscvb52Vz8LDbeLq4ajfKlo1HB6BVYBz5oIovaqFy10mhhSQHCPtG17EWOPK+s1KDJLUsq5tFZuulPoh0PRuY+SndNfW7VFaDB151stVQlxnBMxmjgcoYJOkDLKlQeDV6No+VWZ8Iuer6R7Sk3wrM8EYBatdzB6dWS9I8Shel9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757576592; c=relaxed/simple;
	bh=pr+uKHmF3nSm60SoDILXxEf7pdR00RK/obIA/39HPBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5RO2Wrmxhoi8xXGFe6Dw9bb3oEiiaSHZwNKeiTvpnR+MTAnKHt7XVam5Wj+enDtis2p+j4XglE+2QKGuvZKNSM61gJF9ykZK/aungHiaV356ARYlUl+PFUUWjYas4eKG5RJXpYGWNXyd5FEjnxkZEA2hE9kVKXxHIhrsF/Eqyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEqtKTBZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA08AC4CEF1;
	Thu, 11 Sep 2025 07:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757576592;
	bh=pr+uKHmF3nSm60SoDILXxEf7pdR00RK/obIA/39HPBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEqtKTBZS8qG7O6u2y4lqdxUqcKJ2w29vSpuDJf0OwXctAlUdiYz5vVf9FUNtDNFR
	 5Rrf11A2wXGMhbEEjyqb5ixc6/VhfveXK6dKDHoGrr1rHjK/p6M4qDIrCWV3xF+RIf
	 tgF84XGoIgR4Est8eIsPaV2aopyV5jjoK0ZtSsW65OLfy0q5nerToDAfjtPnqPX+ac
	 Vl8U+2RGnmmX/o1Z9XO2guPebcmz6Au3475RZv9dECIDY2LRtIfCtzDYXdoRyTf6Kw
	 sjk1uA9fqCpIHa1CqbqMZ0mw4SJJIf2nJbHlQ0yO19Px0TzaBg6vnAaJJHRZHQjBnn
	 RRjACHyklo/+w==
Date: Thu, 11 Sep 2025 09:43:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com
Subject: Re: [PATCH v2 1/6] dt-bindings: rtc: Add ST m41t93
Message-ID: <20250911-resolute-translucent-koala-1707dd@kuoka>
References: <cover.1757510157.git.akhilesh@ee.iitb.ac.in>
 <3aed714163abc86a18a62f039b285643d9504e64.1757510157.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3aed714163abc86a18a62f039b285643d9504e64.1757510157.git.akhilesh@ee.iitb.ac.in>

On Wed, Sep 10, 2025 at 07:22:33PM +0530, Akhilesh Patil wrote:
> Document DT bindings for m41t93 rtc which supports time, date,
> alarm, watchdog, square wave clock output provider, user sram
> and 8 bit timer.
> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
>  .../devicetree/bindings/rtc/st,m41t93.yaml    | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/st,m41t93.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/st,m41t93.yaml b/Documentation/devicetree/bindings/rtc/st,m41t93.yaml
> new file mode 100644
> index 000000000000..bd593669cfa2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/st,m41t93.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/st,m41t93.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ST M41T93 RTC and compatible
> +
> +maintainers:
> +  - linux-rtc@vger.kernel.org

Not much improved. This should be a person responsible/caring about this
hardware support in the kernel. Why would we want to take the binding if
no one cares about it?

> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  ST M41T93 is spi based Real Time Clock (RTC) with time, date,
> +  alarm, watchdog, square wave clock output, 8 bit timer and
> +  7 bytes of user SRAM.

Best regards,
Krzysztof


