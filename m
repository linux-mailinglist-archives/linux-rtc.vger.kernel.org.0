Return-Path: <linux-rtc+bounces-5599-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5886CD2B59
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Dec 2025 09:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4F6C300A345
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Dec 2025 08:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3552F99AE;
	Sat, 20 Dec 2025 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fe8fTNpd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2DA2882BE;
	Sat, 20 Dec 2025 08:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766221195; cv=none; b=jr62u0QBEE183CMsX0dBlO7q4V6eGOGgcsZNXcuiwDd7qFj3jhfW/9PJJJ0ETpZfI/jxmiYuB8xLKsoy9+pIQ/6dqPSf2z8ZL4zDuJ5rP/h0zXZZi+ym1VLL4TyENsdBMKJoaAixfyRCek+Pul6Ib+NuqKuyE528leE52QFJ/SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766221195; c=relaxed/simple;
	bh=sTICQXaa+P3ZweWEXrMvmewEuVC/j3tvZNetMU1aoI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+IHW5ne4fU79D7oOFGr6pCSu8QTXmc1msHnBS92ZOptZtCE3Vvx3wyQyZhRhPd7MSxpaObVcUc119/vCHz+jqSge9Sq9C/6aIO7ppFhAcFdW/SwTr0hS21gniJ12tD0JQPnbw1faij1U/rFI3Y652bd0a2rHrEG1+BQPfAk3F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fe8fTNpd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18098C4CEF5;
	Sat, 20 Dec 2025 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766221194;
	bh=sTICQXaa+P3ZweWEXrMvmewEuVC/j3tvZNetMU1aoI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fe8fTNpdJjrgbgFBkxyBkm2CqA1CgNPujmOl7k2di+f5jIz1DUfi4xxH+J7sMVslm
	 ggHyufMSTAvzBmI5ZmkSIfoaEgNzHJREYb5lu2nhABGZGciNMUBGESsmYcuB2K4jcq
	 7BHn8l1tVXTiZp81lsDsDfo2hLzjae2JkPHXGADlqMGbkCrUSKTAEuvXqcu68xjEHP
	 /+aLGUkPo9B3ed2nD3gHVVxjp37JmC1ZwsFO4e1/NfkMaegJ0U+6vDwOw36U3Gk4eD
	 DzS2Mea2lh9gsf7FL9wA+QxsAFuDM6DywKsbqBKYeBzXke3VecoUG+QjYpQupSg82N
	 n82q56vI8wl5g==
Date: Sat, 20 Dec 2025 09:59:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@axis.com
Subject: Re: [PATCH 1/4] dt-bindings: rtc: ds1307: Add epson,rx8901
Message-ID: <20251220-tapir-of-demonic-support-abccde@quoll>
References: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
 <20251219-ds1307-rx8901-add-v1-1-b13f346ebe93@axis.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219-ds1307-rx8901-add-v1-1-b13f346ebe93@axis.com>

On Fri, Dec 19, 2025 at 01:10:35PM +0100, Fredrik M Olsson wrote:
> Add compatible string epson,rx8901 for the Epson RX8901CE RTC.
> 
> Signed-off-by: Fredrik M Olsson <fredrik.m.olsson@axis.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


