Return-Path: <linux-rtc+bounces-5050-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB6DBBCC11
	for <lists+linux-rtc@lfdr.de>; Sun, 05 Oct 2025 22:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0F4914E3E47
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Oct 2025 20:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54949224B15;
	Sun,  5 Oct 2025 20:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M19/OUmP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EE51D63C5
	for <linux-rtc@vger.kernel.org>; Sun,  5 Oct 2025 20:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759697507; cv=none; b=IA+mGyoeELGadC7lkOWWEMq+p1uphhoyY+cLALWuvNlRvnDXl87QXxkGA5ODakVpnb7lT7c7R1a1UmMVeDgxkgkidPh+Gqy84bOUfh+Ail4prkZz7TIg6eXyGGfuk2JodSP6PJx9dees414m9SG5I2N2UVN/XYC1vPTGGI0cWwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759697507; c=relaxed/simple;
	bh=r+vKGYdrZRvVf2P0GDZt8T2Uvu1SoZaw2nypKR7w/js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWn+aNoNg5he4v7HoTtuTQq3FrclMPUVQnLZN4loDmwYrf7/RMeeEe47CIKsBXqXSVCoS2IC+InwCIRo6z1l/fH5eCWqyNp3QghPZeILyX3PHWUW+9En0SLr4n36AREZxNVCxhJypSN6jlioCPOVFRuhrZ796hHZY9rT+wCzSYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M19/OUmP; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 97D291A1110
	for <linux-rtc@vger.kernel.org>; Sun,  5 Oct 2025 20:51:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 681436065F;
	Sun,  5 Oct 2025 20:51:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A75A5102F1D0B;
	Sun,  5 Oct 2025 22:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759697501; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mu1tmBGNqYigMr52Y0gPpBtQh9KcecuwSGzGQQs95D8=;
	b=M19/OUmPz33S3Nsb2OQMbqihXLs02UOvQvq8Hm1BgjkXaWAQ8mZtEVQ4N4fRTp+yKnwtua
	sRqJZP3klksYPFE79d0PQN7naaGAPBXnjzHz3mG61vJUg0i7omvECN1ycR5Lb7qDEWR5Vl
	CqlcOmRjz5ffvZFOEwCIKKdG+iUG6Rxr5jfoRj2pRkIbNFcge82tO6ByFC0ePytOA6J0cJ
	PZVL70I5dr14YCTOZDx/2wK8DFfZkD0qe2/VuoH64OTF/iBIbql+Q+8UzblbP4/k8AEZdf
	I3/ZAsLeFwjS/8AXIGDbu4Q6yOPnHrymMtc3IjJNSoiQ1LRQGUIvVG2k91ziSw==
Date: Sun, 5 Oct 2025 22:51:40 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?Q?T=F3th_J=E1nos?= <gomba007@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: sd2405al: Add I2C address.
Message-ID: <175969748507.3763428.11523548979589755615.b4-ty@bootlin.com>
References: <20250407-rtc-sd2405al-i2c-addr-v1-1-efdd951952c0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407-rtc-sd2405al-i2c-addr-v1-1-efdd951952c0@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 07 Apr 2025 13:48:49 +0200, Tóth János wrote:
> It is common to include the I2C address of the device in the source
> file.
> 
> 

Applied, thanks!

[1/1] rtc: sd2405al: Add I2C address.
      https://git.kernel.org/abelloni/c/75b002a38d4f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

