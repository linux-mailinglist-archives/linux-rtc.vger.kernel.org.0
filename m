Return-Path: <linux-rtc+bounces-5012-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4673B933A1
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Sep 2025 22:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98EF87AD959
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Sep 2025 20:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7901F21D3F5;
	Mon, 22 Sep 2025 20:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmJg1k4B"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA662F28FA;
	Mon, 22 Sep 2025 20:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758572846; cv=none; b=QUfvSl+BWZRmLn+k2W7LScxox6il1RamS+cl4JQuPSlo6YukMODQEmIrJc1ZRRTM9OQHtthTa8nTfEj2todHYCnMuO+XlW3ivpYHqLJk3cQklioU/0Fs036U+UiMy1b96gXfRRkPGLe7ZvpPbitPElwO8PXB5IfsbNvpasCdzqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758572846; c=relaxed/simple;
	bh=tT4FFeQGeTkyJQ4zZ5iczXxChUdCnuPLFeL/ZnUoEM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0pSEutneNCqBU/nPLvZxaCTG8ONGibFykZN4vEu1vkz52rTmA92bLpkEUvsGvyW3M+Yo98X+OainUYq+xUtBWiyqLRLOsY+kLXFn4bb55XY6yLArHvS/Q6gnWbgGrRrFJFTH9fsmGbyaFRIL4qGo+tx2tD5h3zfVSaWbR3UTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmJg1k4B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD975C4CEF0;
	Mon, 22 Sep 2025 20:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758572845;
	bh=tT4FFeQGeTkyJQ4zZ5iczXxChUdCnuPLFeL/ZnUoEM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmJg1k4B4Ei+yFQYj2mMJoebyMTY0NwIYCjGfw6MTmu0QG6Zzg/IevnWgI/iJ0oei
	 FojhVbGOkoUtSeEh40GsTMWklY5xdIjZUE81hLJXS/1PNvqwes8vQb7eVzS2q3MS/G
	 dvzQRsrW+SkVc4u5FAmKbRvgjPRL/MmwWB/U7UndCEgZ2dM+D4grhyUk7/d67qYYcY
	 vdfRG5Bo7hzdlz7JSD+O5p88SDXf4h8QvEUGCzc0TZPrPBvBNPWGkuuFY0fOhDrGH9
	 y2ibosWioyswqyzSfOXPVEG6QH/YKQKMzhnuwptvwOQwndxOFw8EAXmsH0WbQLvrgW
	 mC+vhBMiRXWuA==
Date: Mon, 22 Sep 2025 15:27:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: conor+dt@kernel.org, akhileshpatilvnit@gmail.com,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v3 1/6] dt-bindings: rtc: Add ST m41t93
Message-ID: <175857284421.1275635.17940830202978658586.robh@kernel.org>
References: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>
 <b1b1f7abde8a4ee8b625361bca32934679bf1e1a.1758379856.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1b1f7abde8a4ee8b625361bca32934679bf1e1a.1758379856.git.akhilesh@ee.iitb.ac.in>


On Sat, 20 Sep 2025 20:31:24 +0530, Akhilesh Patil wrote:
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


