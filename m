Return-Path: <linux-rtc+bounces-2123-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 980C499667E
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 12:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C028B1C20A02
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 10:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0D418E345;
	Wed,  9 Oct 2024 10:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYxUg/Cn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F6218E05C;
	Wed,  9 Oct 2024 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468407; cv=none; b=VGSQ5RUHF/3lwIpJ7QNkUavSMQwNnDgYZiCmn6rQljn/CeCbgDrj/LRhu34b6zx93vWLVhsf81PclauJnEVisRVk/2jE2PrpycuuERAdS4a5EqzL4mlcQelCGfX+abHWeJotrgO0F2b6J9bXpqxvrSUIu4xl08gkSKV7HP9Ehi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468407; c=relaxed/simple;
	bh=uLTxIOnXy1v9yT3KDAjoqFg62MCTN/O9vMCI/xag4rg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MCTiYAoQKEYT3YYbrqzIeBlj1zgvyG9pExxaRWKmyRWOxo4TpQyjV24m200ViweWv6WYIesIJ+WTIwHnlXU7prpI8gG7fh9JRiCDAOWXHF6gfEeS2xfdn918YPCYFju2Sc9Gdh0X7n6r9pyED3gXYKLzIyHh47OifPpEJE2qOZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYxUg/Cn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FFCC4CEC5;
	Wed,  9 Oct 2024 10:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728468405;
	bh=uLTxIOnXy1v9yT3KDAjoqFg62MCTN/O9vMCI/xag4rg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tYxUg/CnSlzIiRpchtEl1dFcSwX/x5LCnDf/Zz+ydo2nsEHyirr5RJUcURlodFvUX
	 fCQOOU1jl0SSSpYwPCsQ9mRctZiCQndW02PJW9PXlp5YGdpdfmM3LccIi7dGunjfYs
	 WDrweC70MB8Qw+Q4pyliUej0dCFe5jidn9EAM3Mya/cRYriw2D/0vEXiTL5jcrpRkk
	 uMszZu545TcOASP2TU617eflSWee6+Cvy55KoCsBCcbX++HLtzrqfDFZ48kDqxwWY2
	 JnjKIB1EAzGvmiunlJyB0Uj84IuwE35O8ncT6uvDf2QXWsyW0Ka8+D1plvStzfDgo9
	 NSpWj3FgrvlLQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 Karel Balej <balejk@matfyz.cz>
Cc: duje.mihanovic@skole.hr, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20240920161518.32346-1-balejk@matfyz.cz>
References: <20240920161518.32346-1-balejk@matfyz.cz>
Subject: Re: (subset) [RFC PATCH 1/2] mfd: 88pm886: add the RTC cell and
 relevant definitions
Message-Id: <172846840369.471299.4136306941601177946.b4-ty@kernel.org>
Date: Wed, 09 Oct 2024 11:06:43 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 20 Sep 2024 18:12:34 +0200, Karel Balej wrote:
> RTC lives on the base register page of the chip. Add definitions of the
> registers needed for a basic set/read time functionality.
> 
> 

Applied, thanks!

[1/2] mfd: 88pm886: add the RTC cell and relevant definitions
      commit: 0a936c2c45884b9a3800379f3cab4d0a685d63f5

--
Lee Jones [李琼斯]


