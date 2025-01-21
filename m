Return-Path: <linux-rtc+bounces-2994-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295CA17AFB
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 11:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42BB13A1747
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 10:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29591E5713;
	Tue, 21 Jan 2025 10:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izfXe+4k"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5AF1B87C2;
	Tue, 21 Jan 2025 10:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737453982; cv=none; b=q274KfIq0RPBuNzKqRKavNZjrBFFB62SQAYVOTTcALZw6zBmUSWY6X3FmSvYiDDUlSaoPR5BqESa9Am6jLPhV1nJgAVAxffR25UkcymAX8K7c3/sdKwfoJaGEQ6Qb/6o8re1EHejMzUliSjODeClXTpLWI2ZRfzxNRke3t8Z5dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737453982; c=relaxed/simple;
	bh=7FWr/ORFioTWE9cjlvGZ8zTlAMHhOvAw8UExX9n1Zm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fq9Hfk9a8Uvclalb2wYz/MDVbOqSpwHl1WjvMADSEHY37nkU3mfEvQ4RZN9/XomML2qT6NcUw98pJ2LdRVUpJUVI77FKM8i8lvpDWyhVd8d4QBF3QTDWXPgh0iYeeom+P25D1boEdQFgLR7r6q67JKL0DbIbqCzA3qZdBZQhiy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izfXe+4k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D12DC4CEDF;
	Tue, 21 Jan 2025 10:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737453982;
	bh=7FWr/ORFioTWE9cjlvGZ8zTlAMHhOvAw8UExX9n1Zm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=izfXe+4k+9UoFvXiMcp814+3fmb5qOrEWwBW+la2LZmTEMMJWnQKxJ+C3objx88wZ
	 z/cyQWl0ZTAszBuE5gL64PeThsuY3are3Qjc3pkNZrsHoRMWIaPDJlitsALXBkmNri
	 kz1oe72HbnlQiEJmtVbnRDTO1+79LtK+hdUBuek8MxEHsnotZciz55BL4Mc45dRpC0
	 ghyjNtmb16ebNzVDL6wICONFNBY8RMHACniLm+PdUmELqxvBLTLZYpUbMbaj4ur5YZ
	 XXcKXIgRdU7TW51WCteyS0/pqvJONNF4zqbgeQdxvQSbYF42Hj8XXSD2m9XrIR3mxb
	 sAA1b5cFy1EzQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1taB9N-000000008F2-3jtU;
	Tue, 21 Jan 2025 11:06:25 +0100
Date: Tue, 21 Jan 2025 11:06:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: x1e80100: enable rtc
Message-ID: <Z49xoSvzZ_hCGZP-@hovoldconsulting.com>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-8-johan+linaro@kernel.org>
 <d6ff6f2e-9280-4fd0-af4c-f50b35652800@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6ff6f2e-9280-4fd0-af4c-f50b35652800@oldschoolsolutions.biz>

On Mon, Jan 20, 2025 at 07:12:05PM +0100, Jens Glathe wrote:

> works nicely on SnapDragon Dev Kit X1E001DE. Thank you!
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Thanks for testing.

Johan

