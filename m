Return-Path: <linux-rtc+bounces-2214-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8169C9A03A7
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 10:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3DF61C28848
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 08:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3243D1D2B39;
	Wed, 16 Oct 2024 08:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SW/QIACp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EA11AAE17;
	Wed, 16 Oct 2024 08:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065893; cv=none; b=tqKjvOHYEVRYOayBWOD4j5nPGH5YKcSTuKWuj5dn76w1yMMMAPc9k6xxGmGL9VXk7Z3Nvoz0ikhRn1RnaYJQREq8pTX2CkhC/2gMRBHQA7kVHB4FlKsvH53NS9WacD3WwVSnfijxCSxhkIKKbOpekFZg82xXd8HfPqYBaYoTDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065893; c=relaxed/simple;
	bh=v+qBEppypquywLvv4BUQnhRMQDDzEWPKeUkhrBX+4uI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WyClZXYRoNgAc9Uy48yrFdSbqv+rWud5qpJ2+GyyigOio6/G7hDBZVrnboWwiJXNW2tEjYKlB/K6WQwX3zJAtkAVrwBTgK5QL0W7Ausi9UgFu2HhRsJKTYKPPE6yoHV4J7Rk3gENHyYpTdJQhR9EmHEZ3KxEbX87fnYZT8N1cZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SW/QIACp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF18C4CEC5;
	Wed, 16 Oct 2024 08:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729065892;
	bh=v+qBEppypquywLvv4BUQnhRMQDDzEWPKeUkhrBX+4uI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SW/QIACp+Dz1pDNpAGxWc6any/7DwZYe82WfXw3koGwt4aq6ftY97vPQLPzot5bxg
	 J2OFUsj1K6laUN8TRK4bhpj74DioBce0LqfHKw1DH0v1RAkOg4H3zc5G7VfNI9z4yl
	 TArCuhVgXPlTQkAPulTV5jbpQ5z3pdBPIdiHNbCbblq1kN2F1drEc7eBDrVjfUh+V3
	 I0yxY/NCet3q6E9QMmdbmo02iZIWGx4OTfUrsx7KFPeNmAsG2Qpkd736B5zf1Kkfja
	 x5u/mG5EXpVO98ORGLEIQldLgu+3//7xQFoYiPmSMVZWyOx0YgPQEqpnoPYcdxgS4x
	 1GyN3zmI+PKkg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, eddie.huang@mediatek.com, sean.wang@mediatek.com, 
 alexandre.belloni@bootlin.com, sen.chu@mediatek.com, 
 macpaul.lin@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 kernel@collabora.com
In-Reply-To: <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397:
 Add start-year property to RTC
Message-Id: <172906588925.1150194.7403716140850738159.b4-ty@kernel.org>
Date: Wed, 16 Oct 2024 09:04:49 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 23 Sep 2024 12:00:08 +0200, AngeloGioacchino Del Regno wrote:
> Enable evaluating the start-year property to allow shifting the
> RTC's HW range.
> 
> 

Applied, thanks!

[1/3] dt-bindings: mfd: mediatek: mt6397: Add start-year property to RTC
      commit: 0a98b711db1345687df995495ee1d097bba5a958

--
Lee Jones [李琼斯]


