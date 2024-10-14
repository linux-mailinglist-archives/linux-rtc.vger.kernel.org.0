Return-Path: <linux-rtc+bounces-2178-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D5799C175
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2024 09:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A84D1F2183D
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2024 07:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135AC14A0BC;
	Mon, 14 Oct 2024 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESmJVxze"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FDE148317;
	Mon, 14 Oct 2024 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891273; cv=none; b=CVtF67KkzXaiZHAROMsHmd+JABFtT0IFVE9DagBFCXoA1tLIudAQ6w7CcYCkhh+1dtZfT18bHmkhUT9dAUwd7jsAVBx/rhQJpC0jDR53RJFHvVAQDsI0iU4zORCUfqxks+RFO8DdxuZV01eBwF8GZs1ZxijphPlV6ggUDpC8dwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891273; c=relaxed/simple;
	bh=zSca8H446kgM10J6EthHk+mZXLgNPvHGOi1Sh/opFdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dw6zMU/bs+VocseLKlTi6QHJ/TeSMyTE2S8V78YLyzt0LwdP/NY7yZvFtUdHnti2S/CKfuF0wpqjBzaAswfILJ0lnar69n9Zfn0nq+WPp6pNWVI4dEhOUAVA9aLAGsJfsdp5/S/snTs6O30WMyoU958RPGvIHHq3w0b4D78Sc4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESmJVxze; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F872C4CEC3;
	Mon, 14 Oct 2024 07:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728891272;
	bh=zSca8H446kgM10J6EthHk+mZXLgNPvHGOi1Sh/opFdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESmJVxzeBmvTnVS8KTerTl4PSv3JyGeErFl9ZgfWU8MvZM7/Tisa18KNaqvY/DKzM
	 +NuPgSPq9YfyEDIhjNRxbiTsvtlyP2pxsP+dZ/jTOvjNB924HX+EzYQDhvgjabhc+/
	 yea4crlai/Z3o7And/9D8XOoh5fHfx4W5YUItKSGWcFgHlb63rU/KRqPi0mBLHy5Gh
	 nuy/EBs34ft+Zzi/KFSTE3xj67J1C2jziwuKCumQevNaeC/wcgFT0E8+DmD9FQbB1m
	 F2nZq0pAD5lvGg3xGqI5OmJjjjzikiJFVzAySGADB8HAkuH3/JHroIjwLy+QRKIeYs
	 j9OwenWk8GPaQ==
Date: Mon, 14 Oct 2024 09:34:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Satya Priya <quic_c_skakit@quicinc.com>, 
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: rtc: qcom-pm8xxx: document no-alarm
 flag
Message-ID: <gpika7a5ho36gx3pz7k5t4rz5spvpnmnvzs277r64z2npdmfmg@4vcmw6x5zvwn>
References: <20241013051859.22800-1-jonathan@marek.ca>
 <20241013051859.22800-3-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241013051859.22800-3-jonathan@marek.ca>

On Sun, Oct 13, 2024 at 01:15:27AM -0400, Jonathan Marek wrote:
> Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
> Thus writing to RTC alarm registers and receiving alarm interrupts is not
> possible.
> 
> Add a no-alarm flag to support RTC on this platform.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> index d274bb7a534b5..210f76a819e90 100644
> --- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> @@ -40,6 +40,11 @@ properties:
>      description:
>        Indicates that the setting of RTC time is allowed by the host CPU.
>  
> +  no-alarm:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Indicates that RTC alarm is not owned by HLOS (Linux).

This is not even properly used/tested, because you disable the RTC
entirely in your DTS.

I expect here unified property for all Qualcomm devices for this case.
We already have "remotely-controlled" and other flavors. I don't want
each device to express the same with different name...

Also: missing vendor prefix.

Best regards,
Krzysztof


