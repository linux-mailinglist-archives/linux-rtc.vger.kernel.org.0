Return-Path: <linux-rtc+bounces-2995-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF4A17AFF
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 11:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F6837A229E
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 10:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BEB1E5713;
	Tue, 21 Jan 2025 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uS42LviR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC71B1B87C2;
	Tue, 21 Jan 2025 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737454016; cv=none; b=o2XuboyawJ5zns8xIUiSJBUHQn8OZ5qvLRMhHCp95bTwqREnQUuTzqbgC9ymHlqhJORVfiSNMKhIpg+FGxcdsca0YoPsW+OUJVp9aaRXt81fZpmt8hjtoePU2DjXntX3gcpnXW2LJy5lxaeUoVsvRX5BGPGMxrYkrQOqcW4SlZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737454016; c=relaxed/simple;
	bh=sMvv+mmOwXTDN8mJYLVu51V45P6Y9zcwjMPhsQFAkmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBytw0cXyvuXMOZmtmhc1UDXWEYlxent4MvSJGC0g2OiaoIZaCYKakKwJ2BygGC2UI7jQJSSuS+s7XfWkOSUMLvZdb6jevBtXXxnngxSihA7Q36Q1EiY4osX+QyecymV3kkqIQrgEXpMSk//mJ25I28p6I5Livvkx/AwipLRHok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uS42LviR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F35C4CEDF;
	Tue, 21 Jan 2025 10:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737454016;
	bh=sMvv+mmOwXTDN8mJYLVu51V45P6Y9zcwjMPhsQFAkmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uS42LviR3kWJATzZUTb9Ty1WpjKwcO9EVOayC+4q1SxBgan6JzTYE3rJO85QOvj1a
	 bhyXFzB4k9iEb3bd8txe1yBi+gipP6beY+zq+nOx1PIs2HdElShzcdEan1upFOE+7p
	 0QeoTpalprhwCBi5VmsXMM4CWeUYfnxW9MxLycWXa4T/xWFo9PFAVoplj5ShKAdgi6
	 CT/yCc3eggvBYBilX/O/Aquro0ivSELvk30f4se1cNCE4r88em7HeHo3NMm53/4nQZ
	 N9ddH+NgTLZcHqt4FzxqWe8lm22NRLZUzS5ylDIeBAqmsN6FzS07d+koAErB/mQ1xF
	 8lWeHDlOfWVGg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1taB9v-000000008Fe-3dcZ;
	Tue, 21 Jan 2025 11:06:59 +0100
Date: Tue, 21 Jan 2025 11:06:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Steev Klimaszewski <steev@kali.org>
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
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: enable rtc
Message-ID: <Z49xww1IW4a-eolv@hovoldconsulting.com>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <CAKXuJqhttfPg7JV_n85bb5v6VKye0F4rYTfWdDYMowdgo83oug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKXuJqhttfPg7JV_n85bb5v6VKye0F4rYTfWdDYMowdgo83oug@mail.gmail.com>

On Mon, Jan 20, 2025 at 03:19:33PM -0600, Steev Klimaszewski wrote:

> Tested this on the Thinkpad X13s, as well as booting it into Windows
> and verifying that it has the correct clock both ways, which it does.
> Thank you!
> 
> Tested-by: Steev Klimaszewski <steev@kali.org>

Thanks for testing.

Johan

