Return-Path: <linux-rtc+bounces-3250-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A916FA42A6D
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Feb 2025 18:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 699D63B1EE9
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Feb 2025 17:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFEB264A96;
	Mon, 24 Feb 2025 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTtrGwCL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C753264A85;
	Mon, 24 Feb 2025 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740419734; cv=none; b=HfzC8UflPhqaENplJ6hxy8rxfJV/MlhabJtFVluD03VkOHomeWb3t+H8TBpiqNUVNcFgPSJcJlg0mRkOymwkduELLCG1SyKsP6jUtpmbkMfnzPb7cYZ9iFusLmwadpidK3+SwM0s325DtBGUrMSIyrgFRbax7b3TpIi46TrWhq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740419734; c=relaxed/simple;
	bh=iqkWrOywlTXP+TDM/+KsWRJIvB4XNPt90mmD/JLzT0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbVEqQ/3HFOnlrcxCd6jDNYagL+5FW5zWW71hGIzttw1CRBdVip2XOdos16+dXcYmtQnKtLXIIFp8ZRKXo7uDM5D8Luk3lMpz0Q6QqMWdSoWAgIxWWvjP5blBiQFcV/ACftJJRKIvYRF7VKXUHr34UiIuQmDlxhUZynxjiEktkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTtrGwCL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5E5C4CEE7;
	Mon, 24 Feb 2025 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740419734;
	bh=iqkWrOywlTXP+TDM/+KsWRJIvB4XNPt90mmD/JLzT0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTtrGwCLwqFKqlUaB703w6gzeptcDSmBfUQLrLJrmoZ4p7QDtQ3+4YD7WP1fznH8J
	 PrTlr+LEJBvILLPf2aTbY/nmh+A80nq3D3UzdUGGf/Tx+fHmIIlSWb8+f6eJIFfdwp
	 Ft93uF7IzZR1KMdDMftaaZs5RDZsO90n8DiyIa4AH48VxLDxs/ztBUjoqRScQn5DRt
	 iVsdR8uXu/3Vw9+Y/MWE08aEVn/eXEv8biYF9QCxnx8yGTNRRIXIwvg58N/OXFbsyh
	 /xQbZYZYEt+23lN3EJJPy/feOvM8KfTv9TVSMnFEpeubQOta48VEYJyb+DBrUjlpAe
	 PYaMHrFDm6BWg==
Date: Mon, 24 Feb 2025 17:55:27 +0000
From: Simon Horman <horms@kernel.org>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, virtio-dev@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 1/4] virtio_rtc: Add module and driver core
Message-ID: <20250224175527.GF1615191@kernel.org>
References: <20250219193306.1045-1-quic_philber@quicinc.com>
 <20250219193306.1045-2-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219193306.1045-2-quic_philber@quicinc.com>

On Wed, Feb 19, 2025 at 08:32:56PM +0100, Peter Hilber wrote:

...

> +/**
> + * VIORTC_MSG() - extract message from message handle
> + * @hdl: message handle
> + *
> + * Return: struct viortc_msg
> + */
> +#define VIORTC_MSG(hdl) ((hdl).msg)
> +
> +/**
> + * VIORTC_MSG_INIT() - initialize message handle
> + * @hdl: message handle
> + * @viortc: device data (struct viortc_dev *)
> + *
> + * Context: Process context.
> + * Return: 0 on success, -ENOMEM otherwise.
> + */
> +#define VIORTC_MSG_INIT(hdl, viortc)                                         \
> +	({                                                                   \
> +		typeof(hdl) *_hdl = &(hdl);                                  \
> +									     \
> +		_hdl->msg = viortc_msg_init((viortc), _hdl->msg_type,        \
> +					    _hdl->req_size, _hdl->resp_cap); \
> +		if (_hdl->msg) {                                             \
> +			_hdl->req = _hdl->msg->req;                          \
> +			_hdl->resp = _hdl->msg->resp;                        \
> +		}                                                            \
> +		_hdl->msg ? 0 : -ENOMEM;                                     \
> +	})
> +
> +/**
> + * VIORTC_MSG_WRITE() - write a request message field
> + * @hdl: message handle
> + * @dest_member: request message field name
> + * @src_ptr: pointer to data of compatible type
> + *
> + * Writes the field in little-endian format.
> + */
> +#define VIORTC_MSG_WRITE(hdl, dest_member, src_ptr)                         \
> +	do {                                                                \
> +		typeof(hdl) _hdl = (hdl);                                   \
> +		typeof(src_ptr) _src_ptr = (src_ptr);                       \
> +									    \
> +		/* Sanity check: must match the member's type */            \
> +		typecheck(typeof(_hdl.req->dest_member), *_src_ptr);        \

Hi Peter,

FWIIW, this trips up sparse because from it's perspective
there is an endianness mismatch between the two types.

> +									    \
> +		_hdl.req->dest_member =                                     \
> +			virtio_cpu_to_le(*_src_ptr, _hdl.req->dest_member); \
> +	} while (0)
> +
> +/**
> + * VIORTC_MSG_READ() - read from a response message field
> + * @hdl: message handle
> + * @src_member: response message field name
> + * @dest_ptr: pointer to data of compatible type
> + *
> + * Converts from little-endian format and writes to dest_ptr.
> + */
> +#define VIORTC_MSG_READ(hdl, src_member, dest_ptr)                     \
> +	do {                                                           \
> +		typeof(dest_ptr) _dest_ptr = (dest_ptr);               \
> +								       \
> +		/* Sanity check: must match the member's type */       \
> +		typecheck(typeof((hdl).resp->src_member), *_dest_ptr); \

Ditto.

> +								       \
> +		*_dest_ptr = virtio_le_to_cpu((hdl).resp->src_member); \
> +	} while (0)
> +
> +/*
> + * read requests
> + */

...

